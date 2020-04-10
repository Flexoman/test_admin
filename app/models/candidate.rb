class Candidate < ApplicationRecord

  # enum source: %w{
  #   indeed
  #   linkedin
  #   zip_recruiter
  #   glassdoor
  #   github
  #   stack_overflow
  #   career_site
  #   sourced
  #   referral
  #   added
  #   other
  # }

  enum candidate_origin: {
    manually: 0,              # common
    applied: 1,               # career site
    sourced: 2,               # chrome extention
    imported: 3,              # pdf - cv - import
  }, _prefix: :source

  belongs_to :company
  belongs_to :cv, class_name: 'Document', optional: true
  belongs_to :pdf_cv, class_name: 'Document', optional: true

  has_many :pipeline_stage_candidates, dependent: :destroy
  has_many :jobs, through: :pipeline_stage_candidates
  has_many :pipeline_stages, through: :pipeline_stage_candidates

  has_many :reason_associations, dependent: :destroy

  has_many :tag_associations, -> { order(id: :asc) }, dependent: :destroy
  has_many :tags, through: :tag_associations, dependent: :destroy
  has_many :source_associations, -> { order(id: :asc) }, dependent: :destroy
  has_many :sources, through: :source_associations, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :star_associations, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_one :extract_doc, dependent: :destroy
  has_many :interviews, dependent: :destroy
  belongs_to :avatar, class_name: 'Document', optional: true, dependent: :destroy
  # has_many :rejection_reasons, -> { where(kind: 'rejection')}

  attr_accessor :tag_name, :is_rejected

  #  return email_0 email_1 email_2 ... email_n
  def self.map_field(field)
    30.times.map { |index| "#{field.to_s.gsub(/s$/, '')}_#{index}".to_sym }
  end

  searchkick word_start: [
    :cover_letter, :cv_document,
    :full_name,
    *map_field(:emails), *map_field(:phone_numbers), *map_field(:tags), *map_field(:sources), *map_field(:custom_fields),
  ]
  #callbacks: :async #TODO add
  # , merge_mappings: true,
  #    mappings: mapping

  scope :search_import, -> { includes(:tags, :jobs, :extract_doc, :avatar) }
  after_commit :reindex

  def search_data
    members_ids = jobs.map{|j| j.users }.flatten.map(&:id).uniq

    attr = {
      type: 'candidate',
      members_ids: members_ids,
      full_name: full_name,
      cover_letter: cover_letter,
      avatar: avatar ? { public_url: avatar.public_url } : nil,
      cv_document: extract_doc&.content || '',
      company_id: company_id,
      created_at: created_at,
      updated_at: updated_at,
      emails: emails,
    }

    #conver from array [] to index_key
    [ :emails,
      :phone_numbers,
      :custom_fields,
    ].each do |map_key|
      self.class.map_field(map_key).each_with_index do |k, index|
        if self.send(map_key)[index].present?
          attr[k] = self.send(map_key)[index]
        end
      end
    end

    #conver from array [] to index_key
    [ :tags,
      :sources ].each do |map_key|
      self.class.map_field(map_key).each_with_index do |k, index|
        if self.send(map_key)[index].present?
          attr[k] = self.send(map_key)[index].name
        end
      end
    end

    attr
  end

  def should_index?
    archived_at.nil?
  end

end

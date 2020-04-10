class Job < ApplicationRecord
  include CreatesHelper

  has_many :pipeline_stages, dependent: :delete_all
  has_many :pipeline_stage_candidates, dependent: :delete_all
  has_many :candidates, through: :pipeline_stage_candidates
  has_one :application_form, dependent: :destroy
  has_one :evaluation_form, dependent: :destroy
  # has_many :job_application_fields, through: :job_application, class_name: 'ApplicationForm', foreign_key: :job_id
  has_many :application_custom_fields, dependent: :delete_all
  has_many :star_associations, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :job_users, dependent: :destroy
  has_many :users, through: :job_users
  has_many :attachments, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :evaluation_forms, dependent: :destroy

  belongs_to :department, optional: true
  belongs_to :company

  scope :active, -> { where(status: :active) }
  scope :without_archived, -> { where.not(status: :archive) }

  enum status: %w{
    active
    internal_use
    draft
    archive
  }

  enum employment_type: %w{
    full_time
    part_time
    contract
    temporary
    internship
    other
  }

  def archived_at=(val)
    self.status = 'archive'
    super
  end

  before_save :init_slag

  def init_slag
    require 'translit'
    _title = Translit.convert(title.to_s, :english) rescue title.to_s
    new_slag = _title.parameterize
    if slag&.gsub(/-\d+/,'') != new_slag
      res = if new_record?
        self.class.where("slag ILIKE :slag", slag: "#{new_slag}%")
      else
        self.class.where("id != '#{self.id}' AND slag ILIKE :slag", slag: "#{new_slag}%")
      end

      if res.present?
        self.slag = "#{new_slag}-#{res.size}"
      else
        self.slag = new_slag
      end
    end
  end

  def get_seo_title
    [ self.title,
      self.location,
      (self.is_remote? ? 'Remote' : '')
    ].join(' ')
  end

  def get_seo_description
    html_doc = Nokogiri::HTML(self.description.gsub("</p>", "</p>\n "))
    html_doc.text().first(210)
  end

  def applied_pipeline_stage
    pipeline_stages.find_by(is_default: true, stage_type: 'applied') || create_default_stage
  end


  def clone_application_form(company)
    application_form = self.create_application_form(company: company)
    return application_form unless company.application_form

    application_form.update(settings: company.application_form.settings)

    company.application_form.application_custom_fields.each do |cf|
      newcf = cf.dup
      newcf.job_id = self.id
      newcf.application_form_id = application_form.id
      newcf.save
    end

    application_form
  end

  searchkick callbacks: :async, word_start: [ :title, :department, :location, :description ]

  after_commit :reindex

  def search_data
    {
      type: 'job',
      title: title,
      department: department&.title,
      status: status,
      location: location,
      description: description,
      company_id: company_id,
    }
  end

  def should_index?
    archived_at.nil?
  end
end

class Attachment < ApplicationRecord

  enum visibility: %w{
    everyone
    members
    self
  }

  belongs_to :job, optional: true
  belongs_to :candidate, optional: true

  has_many :files, as: :linkable, class_name: 'Document'
  has_many :shared_members, primary_key: :member_ids, foreign_key: :id, class_name: 'User'

  def company
    (job || candidate).company
  end

  def member_ids
    read_attribute(:member_ids)&.map(&:to_i)
  end

  def file_type
    return 'link' if self.link.present? && self.files.blank?
    'file'
  end

end

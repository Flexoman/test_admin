class Note < ApplicationRecord
  enum visibility: %w{
    everyone
    members
    self
  }

  has_many :shared_members, primary_key: :member_ids, foreign_key: :id, class_name: 'User'
  belongs_to :job, optional: true
  belongs_to :candidate, optional: true

  has_many :attachments, as: :linkable, class_name: 'Document'

  def company
    (job || candidate).company
  end

  def member_ids
    read_attribute(:member_ids)&.map(&:to_i)
  end

end
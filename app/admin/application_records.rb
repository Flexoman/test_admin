class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  belongs_to :creator, class_name: 'User', foreign_key: :created_by, optional: true

  scope :archived , -> { unscope(:where).where.not(archived_at: nil) }

  def self.archive_all
    update_all(archived_at: Time.zone.now)
  end

end

class Interview < ApplicationRecord

  enum event_type: %w{
    interview
    call
    meeting
  }

  belongs_to :job, optional: true
  belongs_to :candidate, optional: true

  # has_many :members, primary_key: :member_ids, foreign_key: :id, class_name: 'User'
  has_many :users, primary_key: :member_ids, foreign_key: :id

  def member_ids
    read_attribute(:member_ids)&.map(&:to_i)
  end

  def members
    User.select(:id, :first_name, :last_name).where(id: member_ids)
  end

  def event_week_day
    event_date.strftime('%A')
  end

  def full_event_time
    time = "#{event_date.strftime('%d %B %Y')} from #{start_time}"
    time << " - #{end_time}" if end_time.present?
    time
  end

  def ics_view_date field
    return '' if self[field].blank?
    ("#{event_date.to_s} #{self[field].to_s}").to_datetime.strftime('%Y%m%dT%H%M%S%Z')
  end

end

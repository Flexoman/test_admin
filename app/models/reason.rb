class Reason < ApplicationRecord

  belongs_to :company
  has_many :reason_associations, dependent: :destroy
  has_many :candidates, through: :reason_associations, dependent: :destroy

  DEFAULT_REJECTION_NAMES = [
    'no response',
    'culture fit',
    'lack of experience',
    'salary expectations',
    'accepted another job',
  ]

  enum kind: %w{
    rejection
  }

end

class ApplicationForm < ApplicationRecord

  DEFAULT_FIELDS = [
    { name: 'Full Name',    field_type: 'name' },
    { name: 'Email',        field_type: 'email' },
    { name: 'Phone',        field_type: 'phone' },
    { name: 'Cv',           field_type: 'file_upload' },
    { name: 'Linkedin',     field_type: 'link' },
    { name: 'Cover Letter', field_type: 'multi_text' },
  ]

  belongs_to :job, optional: true
  belongs_to :company
  has_many :application_custom_fields, dependent: :delete_all

  validates :job_id, presence: true, unless: -> { destination == 'template' }

  enum destination: %w{
    template
  }

end

class ApplicationCustomField < ApplicationRecord

  FIELD_TYPES = {
    single_text: 7,
    multi_text: 8,
    phone: 1,
    file_upload: 2,
    link: 3,
    boolean: 4,
    single_select: 5,
    multi_select: 6,
  }

  enum field_type: FIELD_TYPES

  enum status: %w{
    hidden
    required
    optional
  }

  belongs_to :application_form
  belongs_to :job, optional: true

end

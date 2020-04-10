class ApplyingCustomAnswer < ApplicationRecord

  belongs_to :applying
  belongs_to :application_form
  belongs_to :application_custom_field, optional: true

  enum field_type: %w{
    name
    email
    text
    phone
    file_upload
    link
    boolean
    single_select
    multi_select
  }, _prefix: :form

end

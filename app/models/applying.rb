class Applying < ApplicationRecord

  belongs_to :cv, class_name: 'Document', optional: true
  belongs_to :pdf_cv, class_name: 'Document', optional: true
  belongs_to :application_form
  belongs_to :job
  has_many :applying_custom_answers, dependent: :delete_all

end

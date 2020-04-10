class EvaluationQuestion < ApplicationRecord

  belongs_to :evaluation_form
  has_many :evaluation_answers

  FIELD_TYPES = {
    score: 0,
    single_text: 7,
    multi_text: 8,
    boolean: 2,
    single_select: 3,
    multi_select: 4,
    file_upload: 5,
    headline: 6,
  }

  enum field_type: FIELD_TYPES, _prefix: :evaluation


end

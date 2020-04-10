class EvaluationAnswer < ApplicationRecord

  belongs_to :evaluation
  belongs_to :evaluation_form

  enum field_type: EvaluationQuestion::FIELD_TYPES, _prefix: :evaluation

  enum rating: %w{
    dislike
    like
    perfect
  }


end

class EvaluationForm < ApplicationRecord

  DEFAULT_FIELDS = [
    { title: 'Soft Skills',            field_type: 'headline' },
    { title: 'Interpersonal Skills',   field_type: 'score' },
    { title: 'Communication',          field_type: 'score' },
    { title: 'Problem Solving',        field_type: 'score' },
    { title: 'Leadership',             field_type: 'score' },

    { title: 'Hard Skills',            field_type: 'headline' },
    { title: 'Work Experience',        field_type: 'score' },
    { title: 'Required Skills',        field_type: 'score' },
    { title: 'Educational Background', field_type: 'score' },

  ]

  belongs_to :job, optional: true
  belongs_to :company

  has_many :evaluation_questions, dependent: :delete_all
  has_many :evaluations, dependent: :delete_all

  validates :job_id, presence: true, unless: -> { destination == 'template' }

  enum destination: %w{
    template
  }

end

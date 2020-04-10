class PipelineStage < ApplicationRecord

  DEFAULT_COLOR = '#c4c5d6'
  DEFAULT_COLOURS = {
    applied: DEFAULT_COLOR,
    sourced: DEFAULT_COLOR,
    phone_screen: '#4599df',
    interview: '#4599df',
    evaluation: DEFAULT_COLOR,
    offer: DEFAULT_COLOR,
    hired: '#5db37e',
  }

  DEFAULT_STAGE_TYPES = %w{
    applied
    sourced
    phone_screen
    interview
    evaluation
    offer
    hired
  }

  SYSTEM_STAGE_TYPES = %w{
    applied
    hired
  }

  belongs_to :job, optional: true
  belongs_to :company, optional: true

  has_many :pipeline_stage_candidates, -> { order(sort_index: :asc) }, dependent: :destroy
  has_many :candidates, through: :pipeline_stage_candidates

  enum destination: %w{
    template
  }

  enum stage_type: {
    applied: 0,
    phone_screen: 1,
    interview: 2,
    evaluation: 3,
    offer: 4,
    hired: 5,
    sourced: 6,
    other: 7,
  }

end

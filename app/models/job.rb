class Job < ApplicationRecord

  has_many :pipeline_stages
  has_many :pipeline_stage_candidates
  has_many :candidates, through: :pipeline_stage_candidates

  belongs_to :department, optional: true
  belongs_to :company

  enum status: %w{
    available
    internal_use
    draft
    archive
  }

  enum employment_type: %w{
    full_time
    part_time
    contract
    temporary
    internship
    other
  }

end
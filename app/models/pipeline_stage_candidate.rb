class PipelineStageCandidate < ApplicationRecord

  belongs_to :candidate
  belongs_to :pipeline_stage
  belongs_to :job, optional: true
  has_many :reason_associations, foreign_key: :candidate_id, primary_key: :candidate_id
  has_many :reasons, through: :reason_associations

  validates_presence_of :candidate_id, :pipeline_stage_id, :job_id

  before_validation do
    self.job_id ||= pipeline_stage&.job_id
  end

end

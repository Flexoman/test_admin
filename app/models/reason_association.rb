class ReasonAssociation < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  belongs_to :reason

end

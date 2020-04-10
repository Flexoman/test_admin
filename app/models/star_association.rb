class StarAssociation < ApplicationRecord

  belongs_to :user
  belongs_to :job, optional: true
  belongs_to :candidate, optional: true

end

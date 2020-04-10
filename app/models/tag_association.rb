class TagAssociation < ApplicationRecord

  belongs_to :candidate
  belongs_to :tag

end

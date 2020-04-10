class Tag < ApplicationRecord

  has_many :tag_associations, dependent: :destroy
  belongs_to :company

end

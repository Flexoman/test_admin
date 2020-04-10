class Source < ApplicationRecord
  has_many :source_associations, dependent: :destroy
  belongs_to :company

end

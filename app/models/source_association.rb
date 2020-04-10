class SourceAssociation < ApplicationRecord
  belongs_to :candidate
  belongs_to :source

end

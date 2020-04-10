class CareerSiteAppearance < ApplicationRecord

  belongs_to :career_site
  belongs_to :logo, class_name: 'Document', optional: true
  belongs_to :favicon, class_name: 'Document', optional: true

end

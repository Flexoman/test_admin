class CareerSiteSection < ApplicationRecord

  attr_accessor :section_type

  belongs_to :career_site
  belongs_to :header_background_image, class_name: 'Document', optional: true
  belongs_to :about_us_background_image, class_name: 'Document', optional: true

end

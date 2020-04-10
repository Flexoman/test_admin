class CareerSite < ApplicationRecord
  attr_writer :seo_jobs

  belongs_to :company
  has_one :career_site_appearance, dependent: :destroy
  has_one :career_site_section, dependent: :destroy

  DEFAULT_BRAND_COLOR = "#716aca".freeze
  DEFAULT_FONT = "Open Sans".freeze
  DEFAULT_IS_ONLINE = true.freeze
  DEFAULT_SEO_INDEXING = true.freeze
  DEFAULT_PRIVACY_POLICY_CONTENT = "
    <p>Certain but she but shyness why cottage<br/>
    In entirely be to at settling felicity. Fruit two match men you seven share. Needed as or is enough points. Miles at smart ﻿no marry whole linen mr. Income joy nor can wisdom summer. Extremely depending he gentleman improving intention rapturous as.</p>
    <p>Certain but she but shyness why cottage<br/>
    In entirely be to at settling felicity. Fruit two match men you seven share. Needed as or is enough points. Miles at smart ﻿no marry whole linen mr. Income joy nor can wisdom summer. Extremely depending he gentleman improving intention rapturous as.</p>
    <p>Certain but she but shyness why cottage<br/>
    In entirely be to at settling felicity. Fruit two match men you seven share. Needed as or is enough points. Miles at smart ﻿no marry whole linen mr. Income joy nor can wisdom summer. Extremely depending he gentleman improving intention rapturous as.</p>
  ".squish.freeze

  LANGUAGES = {
    en: 'English',
    ru: 'Russian',
  }

  SOCIALS = %w{
    linkedin
    facebook
    instagram
    twitter
    youtube
  }

  enum language: LANGUAGES.keys

end

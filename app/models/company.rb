class Company < ApplicationRecord
  include CreatesHelper

  attr_accessor :website_address

  PEOPLE_COUNT_VARIANTS = %w[
    1-10
    10-25
    25-50
    50-100
    100+
  ].freeze

  DEFAULT_APPLICATION_EMAIL_CONFIRM_BODY = proc { |company|
    "You can <a href=\"https://#{company.career_site.website_address}.hiro.co/gdpr-erasure-request\">request to be erased</a> from our database anytime."
  }

  enum compliance_status: { disactive: 0, active: 1 }
  enum language: {
    en: 1, de: 2, da: 3, sp: 4, cz: 5, ru: 6
  }
  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_one :career_site, dependent: :destroy
  has_one :application_form, -> { where(destination: 'template')}, dependent: :destroy
  has_one :evaluation_form, -> { where(destination: 'template')}, dependent: :destroy
  has_many :application_forms, -> { where(destination: nil)}, dependent: :destroy
  has_many :evaluation_forms, -> { where(destination: nil)}, dependent: :destroy
  has_many :pipeline_stages, -> { where(destination: 'template')}, dependent: :destroy
  has_many :rejection_reasons, -> { where(kind: 'rejection')}, class_name: 'Reason', dependent: :destroy
  belongs_to :owner, foreign_key: :company_owner_id, class_name: 'User', dependent: :destroy

  has_many :tags, dependent: :destroy
  has_many :sources, dependent: :destroy
  has_many :departments, dependent: :destroy

  accepts_nested_attributes_for :user_companies

  def compliance_status_active?
    compliance_status == 'active'
  end

  def career_site_jobs
    jobs.active.order(sort_index: :asc)
  end

end

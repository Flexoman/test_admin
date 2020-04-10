class User < ApplicationRecord

  SYSTEM_USER_ID = 1

  attr_accessor :token, :confirm_token, :user_email, :full_name
  has_secure_password

  enum role: { administrator: 0,
               recruiter: 1,
               reviewer: 2,
               hiring_manager: 3 }

  enum language: {
    en: 1, de: 2, da: 3, sp: 4, cz: 5, ru: 6
  }

  has_one :user_company, dependent: :destroy
  has_one :company, through: :user_company
  has_one :account_setting, dependent: :destroy
  belongs_to :avatar, class_name: 'Document', optional: true, dependent: :destroy
  has_one :mail_account, dependent: :destroy
  has_many :star_associations, dependent: :destroy
  has_many :job_users, dependent: :destroy

  default_scope { where.not(id: SYSTEM_USER_ID) }

  # TODO logic
  # has_one :own_company, foreign_key: :company_owner_id, class_name: 'Company'
  # has_many :user_companies
  # has_many :companies, through: :user_companies


  def self.system
    User.unscoped.find_by(id: SYSTEM_USER_ID)
  end

  def self.is_valid_password?(psw)
    psw.length > 8 && psw.match(/[a-z]/) && psw.match(/[A-Z]/) && psw.match(/[0-9]/)
  end

  def mailers
    MongoDb::Mailer.where('meta_info.user_id': self.id, 'meta_info.copy': false)
  end

  def jwt
    Knock::AuthToken.new(
      payload: { sub: self.id }
    ).token
  end

  def self.from_token_request(request)
    User
      .where(
        email: request.params['auth']['identifier'],
        archived_at: nil,
      )
      .first
  end

  def full_name
    return first_name if last_name.blank?
    "#{first_name} #{last_name}"
  end

  def invitation_confirmed?
    invitation_confirmed_at.is_a? ActiveSupport::TimeWithZone
  end

  def confirmed?
    confirmed_at.is_a? ActiveSupport::TimeWithZone
  end

  def member?
    %w{ administrator recruiter hiring_manager reviewer }.include? role
  end

  def destroy
    super if self.id != SYSTEM_USER_ID
  end

  def delete
    super if self.id != SYSTEM_USER_ID
  end



end

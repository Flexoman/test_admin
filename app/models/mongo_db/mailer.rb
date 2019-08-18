class MongoDb::Mailer
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: 'mailers'

  field :from_address, type: String
  field :to_address, type: Array
  field :cc_address, type: Array
  field :bcc_address, type: Array
  field :body, type: String
  field :subject, type: String
  field :error, type: String
  field :folder, type: String
  field :meta_info, type: Hash
  field :thread_id, type: String
  field :history_body, type: String
  field :signature_body, type: String
  field :message_id, type: String
  field :references, type: String

  # field :created_at, type: DateTime
  # field :updated_at, type: DateTime

  has_many :attachments, inverse_of: :mailer

  attr_accessor :creator, :created_by, :mail_type

  CONFIG = {
    port: 587,
    authentication: 'PLAIN',
    address: 'smtp.gmail.com',
    user_name: ENV['EMAIL_USER'],
    password: ENV['EMAIL_PASSWORD'],
    enable_starttls_auto: true
  }

  def id
    read_attribute(:id).to_s
  end

  def all_mails
    [*to_address, *cc_address, *bcc_address]
  end

  # def create(*args)
  #   self
  # end

  # def save(*args)
  #   self
  # end

end
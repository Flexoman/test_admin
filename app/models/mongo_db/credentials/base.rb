class MongoDb::Credentials::Base
  include Mongoid::Document

  store_in collection: 'credentials_bases'

  field :address, type: String
  field :port, type: Integer
  field :user_name, type: String
  field :password_encrypted, type: String
  field :domain, type: String
  field :meta_info, type: Hash

  after_initialize do
    write_attribute :_type, self.class._type
  end

  def self._type
    to_s.sub('MongoDb::', '')
  end

  def enable_starttls_auto
    true
  end

  def self.default_decryptor
    @@default_decryptor ||= ActiveSupport::MessageEncryptor.new(ENV['SHARED_SECRET_KEY'])
  end

  def password=(val)
    self.password_encrypted = self.class.default_decryptor.encrypt_and_sign(val)
  end

  def save(opts = {})
    raise "Can`t create Base object, please use specific model" if class_name.include?("Base")

    super
  end

  private

  def password
    self.class.default_decryptor.decrypt_and_verify(password_encrypted)
  end

  def class_name
    self.class.name
  end

  Mongoid::Factory.instance_eval do

    def from_db(klass, attributes = nil, criteria = nil)
      attributes[:_type].present? && attributes.delete(:_type)
      super(klass, attributes, criteria)
    end

  end

end

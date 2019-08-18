class MailAccount < ApplicationRecord

  attr_accessor :email,
                :password,
                :imap_server,
                :imap_port,
                :imap_ssl,
                :smtp_server,
                :smtp_port,
                :smtp_ssl

  enum acc_type: %w{
    hiro
    gmail
    custom
  }

  after_commit :destroy_mongo_credentials, on: :destroy

  def destroy_mongo_credentials
    self.imap&.destroy
    self.smtp&.destroy
  end

  def imap
    MongoDb::Credentials::Imap.find(self.imap_setting_mongo_uid) rescue nil
  end

  def smtp
    MongoDb::Credentials::Smtp.find(self.smtp_setting_mongo_uid) rescue nil
  end


end

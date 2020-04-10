class MailAccount < ApplicationRecord

  attr_accessor :password,
                :imap_server,
                :imap_port,
                :imap_ssl,
                :smtp_server,
                :smtp_port,
                :smtp_ssl,
                :code

  belongs_to :user

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

  def stop_worker!(klass, uid)
    schedule = Sidekiq::ScheduledSet.new
    queues = Sidekiq::Queue.new('default')
    retying = Sidekiq::RetrySet.new

    retying.select do |job|
      job.klass == klass &&
      job.args[0] == uid
    end.map(&:delete)

    schedule.select do |job|
      job.klass == klass &&
      job.args[0] == uid
    end.map(&:delete)

    queues.select do |job|
      job.klass == klass &&
      job.args[0] == uid
    end.map(&:delete)
  end


end

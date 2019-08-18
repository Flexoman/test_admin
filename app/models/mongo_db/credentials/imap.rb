require 'sidekiq/api'
class MongoDb::Credentials::Imap < MongoDb::Credentials::Base
  AUTHENTICATION_TYPE = 'PLAIN'.freeze

  default_scope -> { where(_type: _type) }

  def authentication
    AUTHENTICATION_TYPE
  end

  def self.sidekiq_proccessing(map_id)
    Sidekiq::Workers.new.find do |_,_,params|
      params&.dig('payload', 'args', 0) == map_id
    end
  end

end
class MongoDb::Credentials::Smtp < MongoDb::Credentials::Base
  AUTHENTICATION_TYPE = 'PLAIN'.freeze

  default_scope -> { where(_type: _type) }

  def authentication
    AUTHENTICATION_TYPE
  end

end

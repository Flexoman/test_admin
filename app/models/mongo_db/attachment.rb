class MongoDb::Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: 'attachments'

  field :filename, type: String
  field :url, type: String
  field :s3_path, type: String
  field :mime_type, type: String
  field :file_size, type: Integer

  belongs_to :mailer, inverse_of: :attachments

end
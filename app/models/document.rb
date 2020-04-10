class Document < ApplicationRecord
  MAX_FILE_SIZE = 25*1024*1024

  # belongs_to :document_folder, optional: true
  belongs_to :linkable, polymorphic: true, optional: true
  # belongs_to :file, optional: true

  def destroy

  end

  def delete

  end

  def self.delete_all

  end

  def self.destroy_all

  end


end

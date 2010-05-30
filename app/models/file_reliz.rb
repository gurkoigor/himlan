class FileReliz < ActiveRecord::Base

  belongs_to :reliz
  
  has_attached_file :file_reliz,
    :path => ":rails_root/public/system/upload_file/:id/:style/:filename"

end

class FileReliz < ActiveRecord::Base

  belongs_to :reliz
  
  has_attached_file :file_reliz,
    :path => ":rails_root/public/system/file_relizs/:id/:style/:filename"

end

class FileReliz < ActiveRecord::Base

  belongs_to :reliz
  
  has_attached_file :file_reliz,
    :path => ":rails_root/public/system/file_relizs/:id/:style/:filename"

  validates_attachment_size(:file_reliz,
    {:message => "Размер файла превышает допустимый размер",
     :less_than => 1600.megabytes})

end

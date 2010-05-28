class FileReliz < ActiveRecord::Base

  belongs_to :reliz
  
  has_attached_file :file_reliz,
    :path => ":rails_root/public/system/upload_file/:id/:style/:filename"

  #def validate
  #  unless self.poster.content_type =~ /image\/(jpeg|gif|jpg|png)/
  #     errors.add(:photo_content_type, "Wrong format")
  #  end
  #end

end

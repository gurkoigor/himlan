class Screenshot < ActiveRecord::Base  
  belongs_to :reliz
  
  has_attached_file :screenshot,
    :path => ":rails_root/public/system/screenshots/:id/:style/:filename",
    :styles => {:small => "90x90#", :rectangle => "170X90#" }

  attr_accessor :delete_photo

  def validate
    unless self.screenshot.content_type =~ /image\/(jpeg|gif|jpg|png)/
       errors.add(:photo_content_type, "Wrong format")
    end
  end
end

class Screenshot < ActiveRecord::Base  
  belongs_to :reliz
  
  has_attached_file :screenshot,
    :path => ":rails_root/public/system/screenshots/:id/:style/:filename",
    :styles => {:small => "90x90#", :rectangle => "170X90!", :lightbox => "600X400>" }

  attr_accessor :delete_photo

  def validate
    unless self.screenshot.content_type =~ /image\/(jpeg|gif|jpg|png)/
       errors.add(:screenshot_content_type, "Не верный формат")
    end
  end
end

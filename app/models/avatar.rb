class Avatar < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar,
    :path => ":rails_root/public/system/avatars/:id/:style/:filename",
    :styles => {:small => "90x90#"}

  attr_accessor :delete_photo

  def validate
    unless self.avatar.content_type =~ /image\/(jpeg|gif|jpg|png)/
      errors.add(:photo_content_type, "Wrong format")
    end
  end
end

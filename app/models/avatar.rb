class Avatar < ActiveRecord::Base
  belongs_to :user

  DEFAULT_AVATAR = "default_avatar.jpg"

  has_attached_file :avatar,
    :path => ":rails_root/public/system/avatars/:id/:style/:filename",
    :default_url => "default/#{DEFAULT_AVATAR}",
    :styles => {:small => "90x90#"},
    :default_style => :small
  
  attr_accessor :delete_photo

  def validate
    unless self.avatar.content_type =~ /image\/(jpeg|gif|jpg|png)/
       errors.add(:avatar_content_type, "Не верный формат")
    end
  end
  
end

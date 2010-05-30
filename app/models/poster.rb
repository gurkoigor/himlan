class Poster < ActiveRecord::Base
  
  belongs_to :reliz

  DEFAULT_POSTER_PATH = "posters/default_poster.gif"
  
  has_attached_file :poster,
    :path => ":rails_root/public/system/posters/:id/:style/:filename",
    :styles => {:main => "180x>"},
    :default_url => DEFAULT_POSTER_PATH

  attr_accessor :delete_photo

  def validate
    unless self.poster.content_type =~ /image\/(jpeg|gif|jpg|png)/
       errors.add(:photo_content_type, "Не верный формат")
    end
  end
end

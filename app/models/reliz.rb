class Reliz < ActiveRecord::Base
  
  belongs_to :subcategory
  belongs_to :user
  has_one :category, :through => :subcategory
  has_one :poster
  has_many :screenshots
  has_many :file_relizs

  validates_presence_of :title, :description

  accepts_nested_attributes_for :poster, :allow_destroy => true

  #attr_accessible :poster_attributes
  #attr_accessible :screenshot_attributes
  #attr_accessible :file_reliz_attributes

  serialize :params_form

  module Video
    TRANSLATE = [["Любительский(одноголосный)", "1"],
                 ["Любительский(двухголосный)", "2"],
                 ["Любительский(Гоблина)", "3"],
                 ["Профессиональный(одноголосный)", "4"],
                 ["Профессиональный(двухголосный)", "5"],
                 ["Профессиональный(многоголосный, закадровый)", "6"],
                 ["Профессиональный(полное дублирование)", "7"],
                 ["Субтитры", "8"],
                 ["Отсутствует", "9"],
                 ["Не требуется", "10"]]
      QUALITY = [["HDTV","1"],
                 ["HDTVRip", "2"],
                 ["BD Rip", "3"],
                 ["DVD 5", "4"],
                 ["DVD 9", "5"],
                 ["DVDRip", "6"],
                 ["DVDScr", "7"],
                 ["SatRip", "8"],
                 ["TVRip", "9"],
                 ["TS", "10"],
                 ["VHSRip", "11"],
                 ["CamRip", "12"]]
        FORMAT = [["AVI", "1"], ["DVD Video", "2"], ["MPEG","3"], ["MP4", "4"], ["TS", "5"]]
  end

  def screenshot_attributes=(attrs)
    if !attrs.blank? && !attrs[:screenshot].blank?
      screenshot = Screenshot.new(attrs)
      self.screenshots << screenshot
    end
  end

  def file_reliz_attributes=(attrs)
    if !attrs.blank? && !attrs[:file_reliz].blank?
      file_reliz = FileReliz.new(attrs)
      self.file_relizs << file_reliz
    end
  end

end

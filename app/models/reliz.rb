class Reliz < ActiveRecord::Base
  
  belongs_to :subcategory
  belongs_to :user
  has_one :category, :through => :subcategory
  has_one :poster, :dependent => :destroy
  has_many :screenshots, :dependent => :destroy
  has_many :file_relizs, :dependent => :destroy

  validates_presence_of :title, :description

  accepts_nested_attributes_for :poster, :allow_destroy => true

  serialize :params_form

  module Video
    TRANSLATE = ["Любительский(одноголосный)", "Любительский(двухголосный)",
                 "Любительский(Гоблина)", "Профессиональный(одноголосный)",
                 "Профессиональный(двухголосный)", "Профессиональный(многоголосный, закадровый)",
                 "Профессиональный(полное дублирование)", "Субтитры",
                 "Отсутствует", "Не требуется"]
    QUALITY = ["HDTV", "HDTVRip", "BD Rip", "DVD 5", "DVD 9",
               "DVDRip", "DVDScr", "SatRip", "TVRip", "TS",
               "VHSRip", "CamRip"]
    FORMAT = ["AVI", "DVD Video", "MPEG", "MP4", "TS"]
  end

  module Status
    NEW = "Новый"
    APPROVED = "Утвержденный"
    CLOSED = "Закрыт"
  end

  named_scope :approved, :conditions => {:status => Status::APPROVED}, :order => "created_at DESC"

  def screenshot_attributes=(attrs)
    if !attrs.blank? && !attrs[:screenshot].blank?
      screenshot = Screenshot.new(attrs)
      self.screenshots << screenshot
    end
  end

  def file_reliz_attributes=(attrs)
    if !attrs.blank? && !attrs[:file_reliz].blank?
      file_reliz = FileReliz.new(attrs)
      self.created_at = Time.now
      self.file_relizs << file_reliz
    end
  end

  def approved?
    return self.status == Status::APPROVED
  end

end

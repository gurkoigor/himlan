class Category < ActiveRecord::Base

  has_many :subcategories
  has_many :relizs, :through => :subcategories

  validates_presence_of :name, :title

  BLANK_CATEGORY = -1
end

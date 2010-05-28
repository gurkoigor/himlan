class Subcategory < ActiveRecord::Base

  belongs_to :category
  has_many :relizs

  validates_presence_of :name, :title

end

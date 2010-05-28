class User < ActiveRecord::Base
  acts_as_authentic

  has_many :relizs
  has_one :avatar, :dependent => :destroy

  accepts_nested_attributes_for :avatar, :allow_destroy => true

  def admin?
    return self.is_admin?
  end
end

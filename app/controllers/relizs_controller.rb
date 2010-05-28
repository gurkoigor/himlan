class RelizsController < ApplicationController

  before_filter :require_user
  
  def index
    @categories = Category.find(:all)
    @subcategory = Subcategory.find(:first, :conditions => {:name => params[:subcategory_name]})
    @relizs = @subcategory.relizs.paginate(:per_page => 10, :page => (params[:page] || 1), :order => "updated_at DESC")
  end

  def show
    @categories = Category.find(:all)
    @subcategory = Subcategory.find(:first, :conditions => {:name => params[:subcategory_name]})
    @reliz = Reliz.find(params[:id])
  end

end

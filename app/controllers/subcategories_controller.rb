class SubcategoriesController < ApplicationController

  def index
    @categories = Category.find(:all)
    @category = Category.find(:first, :conditions => {:name => params[:category_name]})
    @subcategories = @category.subcategories.find(:all, :order => "title")
    @relizs = @category.relizs.approved.paginate(:per_page => 10, :page => (params[:page] || 1))
  end

end

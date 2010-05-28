class CategoriesController < ApplicationController

  def index
    @categories = Category.find(:all)
    @relizs = Reliz.find(:all, :order => "updated_at DESC").paginate(:per_page => 10, :page => (params[:page] || 1))
  end

end

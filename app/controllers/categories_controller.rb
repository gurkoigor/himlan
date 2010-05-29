class CategoriesController < ApplicationController

  def index
    @categories = Category.find(:all)
    @relizs = Reliz.approved.paginate(:per_page => 10, :page => (params[:page] || 1))
  end

end

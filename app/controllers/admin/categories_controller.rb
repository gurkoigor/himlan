class Admin::CategoriesController < BaseAdminController
  layout "admin"

  before_filter :require_admin

  def index
    @categories = Category.find(:all).paginate(:per_page => 10, :page => (params[:page] || 1))
  end
  
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path
    else
      render :action => 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to admin_categories_path
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end
end

class Admin::SubcategoriesController < BaseAdminController
  layout "admin"

  before_filter :require_admin

  def index
    @subcategories = Subcategory.find(:all).paginate(:per_page => 10, :page => (params[:page] || 1))
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(params[:subcategory])
      redirect_to admin_subcategories_path
    else
      render :action => "edit"
    end
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])
    if  @subcategory.save
      flash[:notice] = "Save"
      redirect_to edit_admin_subcategory_path(@subcategory)
    else
      flash[:notice] = "Not save"
      render :action => :new
    end
  end

  def destroy
    if Subcategory.destroy(params[:id])
      flash[:notice] = "Destroy"
    else
      flash[:notice] = "Not destroy"
    end
      redirect_to admin_subcategories_path
  end

end

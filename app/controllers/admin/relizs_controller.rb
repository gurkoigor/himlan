class Admin::RelizsController < BaseAdminController
  layout "admin"

  before_filter :categories, :only => [:new, :edit, :screenshots]
  before_filter :reliz, :only => [:edit, :screenshots, :update, :upload_files, :user_created, :remove_poster, :remove_screenshot, :remove_file_reliz]

  before_filter :user_created_or_admin, :except => [:index, :destroy, :new, :create, :update_subcategories]
  before_filter :require_admin, :only => [:destroy]
  before_filter :require_user, :only => [:index, :new, :create, :update_subcategories]

  def index
    if current_user.admin?
      @relizs = Reliz.find(:all, :order => "created_at DESC, updated_at DESC").paginate(:per_page => 10, :page => (params[:page] || 1))
    else
      @relizs = Reliz.find(:all, :conditions => { :user_id => current_user.id}, :order => "created_at DESC, updated_at DESC").paginate(:per_page => 10, :page => (params[:page] || 1))
    end
  end
  
  def new
    @reliz = current_user.relizs.build()
  end

  def edit
  end
  
  def create
    @reliz = current_user.relizs.build(params[:reliz])
    @reliz.year_issue = params[:date][:year_issue]
    if @reliz.save
      flash[:notice] = "Релиз создан, продолжите пожалуйста его оформление"
      redirect_to edit_admin_reliz_path(@reliz.id)
    else
      flash[:notice] = "Релиз не создан"
      render :action => 'new'
    end
  end

  def screenshots
  end

  def upload_files
  end

  def update
    if @reliz.update_attributes(params[:reliz])
      flash[:notice] = "Релиз обновлен"
      redirect_to :back
    else
      flash[:error] = "Релиз не обновлен"
      redirect_to :back
    end
  end
  
  def update_subcategories
    @category = Category.find(params[:category_id])
    @subcategories = @category.subcategories.find(:all, :order => "title")
    render :update do |page|
      page.replace_html "subcategories", :partial => "admin/relizs/subcategories", :object => @subcategories
      page.replace_html "reliz_params", :partial => "admin/relizs/params_#{@category.name}"
    end
  end

  def destroy
    if Reliz.find(params[:id]).destroy
      redirect_to :action => 'index'
    end
  end

  def remove_poster
    Poster.find(params[:poster_id]).destroy
    redirect_to edit_admin_reliz_path(params[:id])
  end

  def remove_screenshot
    Screenshot.find(params[:screenshot_id]).destroy
    redirect_to screenshots_admin_reliz_path(params[:id])
  end

  def remove_file_reliz
    FileReliz.find(params[:file_reliz_id]).destroy
    redirect_to upload_files_admin_reliz_path(params[:id])
  end

  private

  def categories
    @categories = Category.find(:all)
  end

  def reliz
    @reliz = Reliz.find(params[:id])
  end

  def user_created_or_admin
    if (@reliz && (@reliz.user_id == current_user.id)) || current_user.admin?
      return true
    else
      flash[:notice] = "Вы не имеет доступ к этому разделу"
      redirect_to account_url
      return false
    end
  end

end

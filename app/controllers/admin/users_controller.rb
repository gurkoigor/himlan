class Admin::UsersController < BaseAdminController

  layout "admin"
  before_filter :user, :only => [:edit, :update, :destroy, :remove_avatar]
  before_filter :require_admin

  def index
    @users = User.find(:all, :order => "last_request_at DESC").paginate(:per_page => 10, 
      :page => (params[:page] || 1))
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Аккаунт создан"
      redirect_to :action => :index
    else
      flash[:notice] = "Аккаунт не был создан. Проверьте правильность данных"
      render :action => :new
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to admin_users_path
    else
      render :action => :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Пользователь удален"
      redirect_to :action => :index
    else
      flash[:notice] = "Не удалось удалить пользователя"
      redirect_to :action => :index
    end
  end

  def remove_avatar
    Avatar.find(params[:avatar_id]).destroy
    redirect_to :action => :edit
  end

  private

  def user
    @user = User.find(params[:id])
  end

end

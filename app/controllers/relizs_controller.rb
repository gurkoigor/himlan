class RelizsController < ApplicationController

  before_filter :require_user
  before_filter :reliz, :only => [:show]
  
  def index
    @categories = Category.find(:all)
    @subcategory = Subcategory.find(:first, :conditions => {:name => params[:subcategory_name]})
    @relizs = @subcategory.relizs.approved.paginate(:per_page => 10, :page => (params[:page] || 1))
  end

  def show
    @categories = Category.find(:all)
    @subcategory = Subcategory.find(:first, :conditions => {:name => params[:subcategory_name]})
  end

  private
    def reliz
      @reliz = Reliz.find(params[:id])
      if @reliz.approved?
        return @reliz
      else
        flash[:notice] = "Релиз не прошел проверку!"
        redirect_to root_url
      end
    end

end

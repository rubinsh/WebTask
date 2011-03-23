class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def show
    @category = CategoriessHelper.try_get_category(current_user, params[:id])
    if (@category.nil?)
      render :action => 'tasks/not_found'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @task }
      end
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

end

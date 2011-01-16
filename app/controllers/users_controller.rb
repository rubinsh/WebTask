class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to tasks_path, :notice => 'User successfully added.' and @current_user = @user
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.html
    end
  end

  def update
    @user = current_user #User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to tasks_path, :notice => 'User updated successfully.'
    else
      render :action => 'edit'
    end

  end
end

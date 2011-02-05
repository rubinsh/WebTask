class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path, :notice => "Logged in successfully"
    else
      if params[:email] != nil
        flash.now[:alert] = "Invalid login/password combination"
      end
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You were logged out successfully"
  end
end

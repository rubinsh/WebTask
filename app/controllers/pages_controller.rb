class PagesController < ApplicationController
  def home
    @title = "Home - WebTask"
    if user_signed_in?
      redirect_to tasks_path
    end
  end

  def settings
    @title = "Settings - WebTask"
  end

  def about
    @title = "About - WebTask"
  end

  def help
    @title = "Help - WebTask"
  end

end

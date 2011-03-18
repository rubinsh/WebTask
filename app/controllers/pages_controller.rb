class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to tasks_path
    end
  end

  def settings
  end

  def about
  end

  def help
  end

end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def open_id
#  omniauth = env["omniauth.auth"]
#  raise omniauth.to_yaml

    @user = User.find_for_google_openid(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Open ID"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.open_id_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  require 'faraday'
  module Faraday
    class Adapter < Middleware
      def call(env)
        env[:ssl][:verify] = false if env[:ssl]
        process_body_for_request(env)
      end
    end
  end


end
class ApplicationController < ActionController::Base
  attr_writer :current_user

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def remember(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      remember_token = User.digest(cookies[:remember_token])
      @current_user ||= User.find_by(remember_digest: remember_token)
    end
  end

  helper_method :current_user
end

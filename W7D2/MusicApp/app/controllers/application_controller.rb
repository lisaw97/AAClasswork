class ApplicationController < ActionController::Base

  before_action :require_login, only: [:show, :destroy]
  before_action :require_logout, only: [:new, :create]
  helper_method :current_user, :logged_in?, :log_in_user!
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def require_login
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def require_logout
    if logged_in?
      redirect_to user_url(current_user.id)
    end
  end

end

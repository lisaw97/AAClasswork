class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :login
  before_action :require_login, only: [ :show, :destroy ]

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    session[:session_token] == current_user.session_token
  end

  def login(user)
    user.session_token = session[:session_token]
  end

  def require_login
    
  end

end

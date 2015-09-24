class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user


  def current_user
    if @current_user.nil?
      puts session[:user_id]
      @current_user = session[:user_id] if session[:user_id]
    end
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end
end

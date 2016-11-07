class ApplicationController < ActionController::Base
  before_action :require_user
  before_action :require_admin

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 

  #http_basic_authenticate_with :name => "admin", :password => "admin"

  helper_method :current_user 

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def require_user
    unless current_user
      flash[:notice] = "Please log in first."
      redirect_to '/login'
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:notice] = "Only acessibly for admins."
      redirect_to '/songs'
    end
  end

end

class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :admin_exists?


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def admin_user
    @admin_user = User.exists?(admin: true)
  end

  def admin_exists?
    !!admin_user
  end

end

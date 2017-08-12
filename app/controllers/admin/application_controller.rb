class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'admin/application'

  helper_method :current_user

  private 
  def current_user
    current_user ||=User.find(session[:user_id]) if session[:user_id]
  	# current_user ||=User.(session[:]) if cookies[:auth_token]
  end

  def verify_logged_in
  	unless current_user
  		redirect_to admin_login_path
  	end
  end

# def require_current_user
#   redirect_to(:root, :notice => "you must be logged in") unless current_user
# end
  
end

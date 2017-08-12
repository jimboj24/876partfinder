class Admin::SessionsController < ApplicationController
  layout 'admin/login'	
  def new
  end

  def create
    # user = User.find_by_email(params[:email])
  	user = User.authenticate(params[:email], params[:password])
  	#user && user.authenticate(params[:session][:password])
  	if user
  		session[:user_id] = user.id

  		# redirect_to admin_parts_path, :notice => "Logged in"
      redirect_to admin_parts_path, :notice => "Logged in"
  	else
  		flash.now.alert = "Invalid email or password"
  		render 'new'
  	end
  end

  def destroy
    # cookies.delete(:auth_token)
  	session[:user_id] = nil
  	redirect_to admin_login_path, :notice => 'logged Out'
  end
end

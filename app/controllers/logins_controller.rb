class LoginsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:login][:email].downcase)
		if @user && @user.authenticate(params[:login][:password])
			session[:current_user_id] = @user.id
			redirect_to root_path, success: "You are successfully logged in."
		else
			render :show
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to new_login_path, success: "You are successfully logged out."
	end
end

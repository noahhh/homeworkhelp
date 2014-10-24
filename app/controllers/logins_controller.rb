class LoginsController < ApplicationController

	def create
		@login = Login.new(login_params)

		if @login.valid? && @login.authenticated?
			session[:current_user_id] = @login.user.id
			redirect_to root_path, success: "You are successfully logged in."
		else
			render :show
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_path, success: "You are successfully logged out."
	end

	def login_params
		params.require(:login).permit(:email, :password)
	end

end

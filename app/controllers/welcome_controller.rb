class WelcomeController < ApplicationController
  def index
    @users = User.all
    @problems = Problem.all.page(params[:page]).per(10)
    @notes = Note.all
  end
end

class WelcomeController < ApplicationController
  def index
    @users = User.all
    @problems = Problem.all.page(params[:page]).per(10)
    @unsolved_problems = Problem.unsolved.order(created_at: :desc).page(params[:page]).per(10)
    @notes = Note.all
  end
end

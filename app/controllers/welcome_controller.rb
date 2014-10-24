class WelcomeController < ApplicationController
  def index
    @users = User.all
    @problems = Problem.all
    @notes = Note.all
  end
end

class ProblemsController < ApplicationController
  # before_action :authenticate
  before_action :set_problem, only: [:show, :resolved]
  # before_action :current_user


  def index
    @user = current_user
    @problems = Problem.all
    @notes = Note.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      @user = current_user
      UserMailer.problem_submit(@problem.user, @problem).deliver
      redirect_to root_path, notice: "You successfully asked a question!"
    else
      render :new
    end
  end

  def resolved
    @problem.toggle(:resolved)
    @problem.save
    redirect_to root_path, notice: "Your problem has been resolved."
  end

  # def resolved
  #   @problem = Problem.find(params[:problem_id])
  #   if current_user && current_user.id == @problem.user.id
  #     @problem.update_attribute(:resolved, true)
  #     @problem.save
  #     redirect_to @problem, notice: "You've successfully resolved your problem."
  #   else
  #     redirect_to @problem, alert: "sorry, you can't do that."
  #   end
  # end

  def show
    @problem = Problem.find(params[:id])
  end

  def set_problem
    @problem = Problem.find(params[:id])
    # @problem = current_user.problems.find(params[:id])
  end

  private



  def ensure_user_owns_problem
    if @problem.user != current_user
      render nothing: true, status: :not_found
      # redirect_to root_path, flash: {alert: "You tried to access a problem that does not belong to you."}
    end
  end

  def problem_params
    params.require(:problem).permit(:title, :published_date, :content, :user_id, :body, :note_id, :resolved, :id)
  end
end

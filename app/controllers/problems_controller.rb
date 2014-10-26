class ProblemsController < ApplicationController

  before_action :authenticate
  before_action :set_problem, only: [:show, :edit, :update, :destroy]


  def index
    @problems = Problem.all
    @notes = Note.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      @user = current_user
      UserMailer.new_problem(@problem.user,@problem).deliver
      redirect_to root_path, notice: "You successfully asked a question!"
    else
      render :new
    end
  end

  def resolved
    @problem = Problem.find(params[:problem_id])
    if current_user && current_user.id == @problem.user.id
      @problem.update_attribute(:resolved, true)
      @problem.delete
      redirect_to @problem, notice: "You've successfully resolved your problem."
    else
      redirect_to @problem, alert: "sorry, you can't do that."
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end


  private

  def set_problem
    @problem = Problem.find(params[:id])
    # @problem = current_user.problems.find(params[:id])
  end

  def ensure_user_owns_problem
    if @problem.user != current_user
      render nothing: true, status: :not_found
      # redirect_to root_path, flash: {alert: "You tried to access a problem that does not belong to you."}
    end
  end

  def problem_params
    params.require(:problem).permit(:title, :published_date, :content, :user, :user_id, :body, :note, :note_id, :responder, :resolved)
  end


  private

  def set_problem
    @problem = Problem.find(params[:id])
    # @problem = current_user.problems.find(params[:id])
  end

  def ensure_user_owns_problem
    if @problem.user != current_user
      render nothing: true, status: :not_found
      # redirect_to root_path, flash: {alert: "You tried to access a problem that does not belong to you."}
    end
  end

  def problem_params
    params.require(:problem).permit(:title, :published_date, :content, :user, :user_id, :body, :note, :note_id, :responder, :resolved)
  end
end

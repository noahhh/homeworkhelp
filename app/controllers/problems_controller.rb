class ProblemsController < ApplicationController
  before_action :authenticate

  def index
    @problems = Problem.order(created_at: :desc).page params[:page]
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.build(problem_params)

    if @problem.save
      redirect_to @problem, success: "Your problem has been created."
    else
      render :new
    end
  end

  def destroy
    @problem.destroy
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :text, :user_id, :question_id)
  end
end

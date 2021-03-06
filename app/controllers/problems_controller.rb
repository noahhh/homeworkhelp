class ProblemsController < ApplicationController
  before_action :auth
  before_action :set_problem, only: [:show, :resolved]
  before_action :current_user


  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      @user = current_user
      UserMailer.problem_submit(@problem.user, @problem).deliver
      redirect_to root_path
      flash[:notice] = "You successfully submitted a problem!"
    else
      render :new
    end
  end

  def resolved
    @problem.toggle(:resolved)
    @problem.save
    respond_to do |format|
      format.html do
        @problem.destroy
        redirect_to root_path
      end
      format.js do
        @problem.destroy
        render 'problems/resolved', status: :success
      end
    end
  end


  # def remove_resolved
  #   respond_to do |format|
  #       format.html do
  #         if @problem.resolved == true
  #           @problem.destroy
  #         else
  #           redirect_to root_path, alert: "Sorry, you must enter something.  Anything at all."
  #         end
  #       end
  #       format.js do
  #         if @problem.resolved == true
  #           render "problems/create", status: :created
  #         else
  #           render "problems/create", status: :accepted
  #         end
  #       end
  #   end
  # end

  def show
    @problem = Problem.find(params[:id])
    @notes = @problem.notes
    @note = Note.new
  end

  def set_problem
    @problem = Problem.find(params[:id])
    # @problem = current_user.problems.find(params[:id])
  end

  private
  def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      redirect_to root_path, notice: "You must be logged in to see that."
    end
  end


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

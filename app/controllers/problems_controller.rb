  class ProblemsController < ApplicationController

    before_action :authenticate
    before_action :set_problem, only: [:show, :edit, :update, :destroy]
    before_action :current_user

    def index
      @problems = Problem.all
      @notes = Note.all
      @problems1 = current_user.problems
    end

    def show
      @problems = Problem.all
    end

    def new
      @problem = Problem.new
    end

    def edit
    end


    def create
      # @problem = current_user.problems.build(problem_params)
      @problem = Problem.new(problem_params)
      @problem.user = current_user
      if @problem.save
        UserMailer.problem_submit(@problem.user, @problem).deliver
        redirect_to root_url
      end
    end

    def update
      @problem = Problem.find_by(params[:id])
      @problem.update_attribute(:resolved => true)
    end

    def resolved
        @problem = Problem.where(id: @problems)
        @problem.update_all(:resolved => true)
        flash[:notice] = "Message is available in same request-response cycle"
        redirect_to root_path
    end

    def destroy
      @problem.destroy
      respond_to do |format|
        format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
        format.json { head :no_content }
      end
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

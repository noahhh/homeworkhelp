class NotesController < ApplicationController
  before_action :authenticate


  def index
    @notes = Note.all
    @responder = @user
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.create(note_params)
    if @note.save && @user != current_user
      UserMailer.note_alert(@note.problem.user, @note).deliver
    end
    @note.responder = current_user
    redirect_to problem_path(@problem)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @problem = @note.problem(params[:problem_id])
    @note.destroy
    redirect_to problems_path
  end

  private
  def set_comment
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:responder, :body, :user, :user_id, :problem, :problem_id)
  end
end

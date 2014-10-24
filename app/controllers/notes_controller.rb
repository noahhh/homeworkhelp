class NotesController < ApplicationController


  def index
    @notes = Note.all
  end


  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.create(note_params)
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

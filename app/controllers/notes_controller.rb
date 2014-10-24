class NotesController < ApplicationController
  before_action :authenticate

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
  end

  def destroy
    @note.destroy
  end

  def note_params
    params.require(:note).permit(:user, :body)
  end
end

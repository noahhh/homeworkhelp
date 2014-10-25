require 'test_helper'

class NotesControllerTest < ActionController::TestCase

  setup do
    current_user = User.new
    @note.responder = current_user
  end

	test "should submit note with valid data" do
		get :create
		post :new, {  body: 'nothing', user:{user: :one} }
		assert_not_nil Note.all
	end

	test "should reject note with invalid data" do
		assert_difference('Note.count', 0) do
		get :create
		post :new, { body: "" }
		end
	end

	test "should redirect if not logged in" do
		@note.responder = nil
		get :create
		assert_redirected_to root_path
	end
end

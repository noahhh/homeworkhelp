require 'test_helper'

class NotesControllerTest < ActionController::TestCase

	setup do
		@user = users(:one)
		@note = notes(:one)
		@problem = problems(:one)
	end


	def valid_note_attributes
		{text: "text"}
	end
	def invalid_note_attributes
		{text: ""}
	end


	context "POST :create" do

		context "when I send invalid information" do
			setup { post :create, { note: invalid_note_attributes } }

			should "render new" do
				assert_redirected_to root_path
			end
		end
	end

	context "when I send valid information" do
		setup { post :create, { note: valid_note_attributes } }

		should "create a new note" do
			assert_response :found
		end
	end
#
# 	test "should submit problem with valid data" do
# 		get :new
# 		post :new, { title: 'Wassup', body: 'nothing', user:{user: :one} }
# 		assert_not_nil Problem.all
# 	end
#
# test "should reject note with invalid data" do
# 	assert_difference('Note.count', 0) do
# 	get :new
# 	post :new, { body: "" }
# 	end
# end
#
# test "should redirect if not logged in" do
# 	@user = nil
# 	get :new
# 	assert_redirected_to root_path
# end
end

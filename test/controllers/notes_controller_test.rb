require 'test_helper'

class NotesControllerTest < ActionController::TestCase

	setup do
		@user = users(:one)
		@note = notes(:one)
		@problem = problems(:one)
	end


	 context "request POST :create" do

    context "with invalid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem.id, body: "" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
      assert_redirected_to problem_path(@problem)
      end
      should "instantiate an invalid note" do
        assert assigns[:note].invalid?
      end
    end

    context "with valid info" do
      setup { post :create, { note: { user_id: @user.id, problem_id: @problem.id, body: "asdf" } }, {current_user_id: @user.id} }
      should "redirect to problem's show view" do
        assert_redirected_to problem_path(@problem)
      end
      should "save a note" do
        assert assigns[:note]
        assert assigns[:note].persisted?
      end
      context "when the author adds a note" do

        setup do
          ActionMailer::Base.deliveries.clear
          post :create, { note: { user_id: @user_two.id, problem_id: @problem_two.id, text: "asdf" } }, {current_user_id: @user_two.id}
          # this note needs to be specified differently, because it's failing here but not on the server
        end
        should "not send an email" do
          assert_empty ActionMailer::Base.deliveries
        end
			end
		end
	end
	#  context "with invalid info" do
  #     setup { post :create, { note: { user_id: @user.id, problem_id: @problem.id, text: "" } }, {current_user_id: @user.id} }
  #     should "redirect to problem's show view" do
  #     assert_redirected_to problem_path(@problem)
  #     end
  #     should "instantiate an invalid note" do
  #       assert assigns[:note].invalid?
  #     end
  #   end
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

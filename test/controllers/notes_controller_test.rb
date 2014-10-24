require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  def invalid_answer_data
    { text: "" }
  end
  def valid_answer_data
    { text: Faker::Hacker.say_something_smart }
  end

	# should "redirect to login when invalid user" do
  #   @current_user = nil
  #   get :new
  #   assert_redirected_to new_login_path
  # end

end

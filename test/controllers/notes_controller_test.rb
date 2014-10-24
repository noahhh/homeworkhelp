require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get body" do
    get :body
    assert_response :success
  end

end

require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get title" do
    get :title
    assert_response :success
  end

  test "should get body" do
    get :body
    assert_response :success
  end

end

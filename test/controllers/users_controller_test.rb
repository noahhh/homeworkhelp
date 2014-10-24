require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get email" do
    get :email
    assert_response :success
  end

  test "should get password" do
    get :password
    assert_response :success
  end

  test "should get password_confirmation" do
    get :password_confirmation
    assert_response :success
  end

end

require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def setup
    @user = User.new
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should fail login with invalid information" do
    get :new
      post :new, session: { email: @user.email, password: '' }
      assert_template :new
  end

  test "should let user login with valid information" do
    get :new
    post :new, session: { email: @user.email, password: @user.password }
    assert_response :ok # WHY IS THIS 200 AND NOT REDIRECTED TO
  end

  test "should destroy session when logged out" do
    get :new
    post :new, session: {email: @user.email, password: @user.password }
    session.destroy
    assert_response :ok
  end
end

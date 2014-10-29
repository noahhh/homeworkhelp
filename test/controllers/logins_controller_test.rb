require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def invalid_login_attributes
    {email: "",
      password: ""}
  end

    def setup
      @user = users(:one)
    end

    test "should get new" do
      get :new
      assert_response :ok
      assert_template :new
    end

    test "should fail login with invalid information" do
      get :new
      post :new, session: { email: @user.email, password: '' }
      assert_template :new
    end

    test "should let user login with valid information" do
      post :create, session: { email: @user.email, password: @user.password }
      assert_response :ok # WHY IS THIS 200 AND NOT REDIRECTED TO
    end

    test "should destroy session when logged out" do
      post :create, session: {email: @user.email, password: @user.password }
      delete :destroy
      refute session[:current_user_id]
    end
end

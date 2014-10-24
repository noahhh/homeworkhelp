require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def setup
    @user = User.new
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should fail login with invalid password" do
    get :new
      post :new, session: { email: @user.email, password: '' }
      assert_template :new
  end

  

end

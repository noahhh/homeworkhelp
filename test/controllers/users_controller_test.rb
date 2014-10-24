require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :ok
  end

  # test "should render new with invalid information" do
  #     setup { post :create, { name: "",
  #     email: "",
  #     password: "",
  #     password_confirmation: ""  }
  #     assert_template :new
  # end
end

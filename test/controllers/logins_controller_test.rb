require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :ok
  end
end

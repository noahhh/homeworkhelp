require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :found
  end

  test "should submit problem with valid data" do
    get :new
    post :new, { title: 'Wassup', body: 'nothing', user:{user: :one} }
    assert_not_nil Problem.all
  end

  test "should reject problem with invalid data" do
    assert_difference('Problem.count', 0) do
    get :new
    post :new, {title: ""}
    end
  end

  test "should redirect after create" do
    get :new
    post :new, { title: 'Wassup', body: 'nothing', user:{user: :one} }
    assert_response :found
  end

  test "should redirect if not logged in" do
    @user = nil
    get :new
    assert_redirected_to root_path
  end
end

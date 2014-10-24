require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should submit question with valid data" do
    get :new
    post :new, { title: 'Wassup', body: 'nothing', user:{user: :one} }
    assert_not_nil Problem.all
  end

  # test "should not submit question with invalid data" do
  #   get :new
  #   post :new, {title: '', body: '', user: ""}
  #   assert_nil Problem.count
  # end
end

require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    @problem = problems(:one)
  end

  context "request GET :new" do
    setup { get :new, nil, {current_user_id: @user.id}}
    should respond_with(:ok)
    should render_template('new')
  end

  test "should submit problem with valid data" do
    get :new
    post :new, { title: 'Wassup', body: 'nothing', user:{user: :one} }
    assert_not_nil Problem.all
  end

  should "should reject problem with invalid data" do
    assert_difference('Problem.count', 0) do
    # get :new
    post :create, {title: ""}
    assert render_template("new")
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

  test "patch should :resolve(d) problem" do
    patch :resolved, { id: @problem}, {current_user_id: @user.id}
    assert assigns[:problem].resolved
    assert_redirected_to root_path
  end

  test "should destroy resolved problem with remove_resolved after resolved is called" do
    patch :resolved, { id: @problem}, {current_user_id: @user.id}
    assert assigns[:problem].resolved
    assert @problem.id, nil
  end

end

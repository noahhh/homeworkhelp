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

  # test "should submit problem with valid data" do
  #   assert_difference('Problem.count', 1) do
  #   post :create, { title: 'Wassup', body: 'nothing', user:{user: :one} }
  #   @problem.save
  #   # assert_not_nil Problem.all
  #   end
  # end
  # should "should reject problem with invalid data" do
  #   assert_difference('Problem.count', 0) do
  #   # get :new
  #   post :create, {title: ""}
  #   assert render_template("new")
  #   end
  # end

   context "request POST :create" do
    context "with invalid problem info" do
    setup {post :create, { problem: { user_id: @user.id, title: @problem.title, body: "" } }, {current_user_id: @user.id}  }
      should "not save a problem" do
        assert assigns[:problem].invalid?
      end
      should render_template('new')
    end

    context "with valid problem info" do
      setup do
        ActionMailer::Base.deliveries.clear
        post :create, { problem: { user_id: @user.id, title: @problem.title, body: @problem.body } }, {current_user_id: @user.id}
      end
      should "save the problem" do
        assert assigns[:problem]
        assert assigns[:problem].persisted?
      end
      should "redirect to problem's show view" do
        assert_redirected_to root_path
      end
      should "send problem_posted email" do
        email = ActionMailer::Base.deliveries.last
        assert_equal "Your problem has been created", email.subject
      end
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

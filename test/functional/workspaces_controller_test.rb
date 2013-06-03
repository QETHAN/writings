require 'test_helper'

class WorkspacesControllerTest < ActionController::TestCase
  def setup
    @user = create :user, :plan => 'base', :plan_expired_at => 1.day.from_now
    login_as @user
  end

  test "should get new page" do
    get :new
    assert_response :success, @response.body
  end

  test "should create new workspace" do
    assert_difference "@user.creator_workspaces.count" do
      post :create, :workspace => attributes_for(:workspace), :format => :js
    end
  end
end

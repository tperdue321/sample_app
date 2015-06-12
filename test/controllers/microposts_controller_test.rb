require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  
  def setup
    @micropost = microposts(:orange)
  end
  
  test "create should redirect when not logged in" do
    assert_no_difference 'Micropost.count' do
      post :create, microposts: { content: "Lorem Ipsum" }
    end
    assert_redirected_to login_path
  end
  
  test "destroy should redirect when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_path
  end
  
  test "should redirect for wrong destroy" do
    @user = users(:travis)
    log_in_as(@user)
    assert_no_difference 'Micropost.count' do
      micropost = microposts(:ants)
      delete :destroy, id: micropost.id
    end
    assert_redirected_to root_url
  end
end

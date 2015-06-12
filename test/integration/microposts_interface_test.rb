require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:travis)
  end
  
  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    #invalid submission
    assert_no_difference 'Micropost.count' do
      post microposts_path, micropost: { content: "" }
    end
    assert_select '#error_explanation'
    # valid submission
    content = "Lorem Ipsum"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, micropost: { content: content }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match content, response.body
    # Deleting a post
    micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_path
    #visit another users page
    get user_path(users(:archer))
    assert_select 'a', {count: 0, text: 'delete'}
  end
end

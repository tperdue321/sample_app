require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:travis)
  end
  
  test "layout links for non-logged in user" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_path, count: 0
    assert_select 'a', text: 'Profile', count: 0
    assert_select 'a', text: 'Settings', count: 0
    assert_select "a[href=?]", logout_path, count: 0
  end
  
  test "layout links for logged-in users" do
    get login_path
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path
    assert_select 'a', text: 'Profile', count: 1
    assert_select 'a', text: 'Settings', count: 1
    assert_select "a[href=?]", logout_path
  end
end

require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:travis)
  end
  
  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    # Invalid email address.
    post password_resets_path, password_reset: { email: "" }
    assert @user.reset_token.nil?
    assert_not flash.empty?
    assert_template 'password_resets/new'
    # Valid email address.
    post password_resets_path, password_reset: { email: @user.email }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    # Password reset form.
    user = assigns(:user)
    # Wrong email address.
    get edit_password_reset_url(user.reset_token, email: "")
    assert_redirected_to root_url
    # Inacvtive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)
    # Right email, wrong reset token
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_url
    # Right email, right token
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email
    # Invalid password & confirmation
    patch password_reset_path(user.reset_token),
          email: user.email,
          user: { password: "foobar", password_confirmation: "notfoobar" }
    assert_select 'div#error_explanation'
    # password empty
    patch password_reset_path(user.reset_token), 
          email: user.email,                                      
          user: { password: "", password_confirmation: "" }
    assert_not flash.empty?
    assert_template 'edit'
    # valid password & confirmation
    patch password_reset_path(user.reset_token),
          email: user.email,
          user: { password: "foobaz", password_confirmation: "foobaz" }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end
end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to root_url when not logged in" do
    get users_path
    assert_redirected_to root_url
  end

  test "should redirect to root_url when user not admin" do
    log_in users(:amine)
    get users_path
    assert_redirected_to root_url
  end
end
require 'test_helper'

class Admin::PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_password_resets_new_url
    assert_response :success
  end

end

require "test_helper"

class AuthFlowsTest < ActionDispatch::IntegrationTest
  test 'user can login' do
    get root_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
    user = users(:one)
    user.confirm
    sign_in user
    get root_path
    assert_response :success
  end
end

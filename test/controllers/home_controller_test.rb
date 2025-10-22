require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index if valid user signed in" do
    sign_in users(:one)
    get home_index_url
    assert_response :success
  end

  test "should redirect if not user signed in" do
    get home_index_url
    assert_redirected_to new_user_session_path
  end

  test "should redirect to profile creation if user signed in without profile" do
    sign_in users(:without_profile)
    get home_index_url
    assert_redirected_to new_users_profile_path
  end
end

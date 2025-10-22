require "test_helper"

class Users::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_profile = users_profiles(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get new_users_profile_url
    assert_response :success
  end

  test "should create users_profile" do
    sign_in users(:without_profile)
    assert_difference("Users::Profile.count") do
      post users_profile_url, params: { users_profile: { birthdate: @users_profile.birthdate, first_name: @users_profile.first_name, lang: @users_profile.lang, last_name: @users_profile.last_name } }
    end

    assert_redirected_to root_url
  end

  test "should get edit" do
    get edit_users_profile_url(@users_profile)
    assert_response :success
  end

  test "should update users_profile" do
    put users_profile_url, params: { users_profile: { birthdate: @users_profile.birthdate, first_name: @users_profile.first_name, lang: @users_profile.lang, last_name: @users_profile.last_name } }
    assert_redirected_to root_url
  end
end

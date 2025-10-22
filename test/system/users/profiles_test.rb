require "application_system_test_case"

class Users::ProfilesTest < ApplicationSystemTestCase
  setup do
    @users_profile = users_profiles(:one)
    sign_in users(:one)
  end

  test "should create profile" do
    visit new_users_profile_url

    fill_in "Birthdate", with: @users_profile.birthdate
    fill_in "First Name", with: @users_profile.first_name
    select "English", from: "Language"
    fill_in "Last Name", with: @users_profile.last_name
    click_on "Create Profile"

    assert_text "Profile was successfully created"
  end

  test "should update Profile" do
    visit edit_users_profile_url(@users_profile)

    fill_in "Birthdate", with: @users_profile.birthdate
    fill_in "First Name", with: @users_profile.first_name
    select "English", from: "Language"
    fill_in "Last Name", with: @users_profile.last_name
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
  end
end

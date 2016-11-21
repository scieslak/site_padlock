require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest

  test "user should register providing valid information" do
    visit new_user_path
    fill_user_form(valid_user)
    click_button "Register"

  end

  test "user should not register without valid information" do
    visit new_user_path

    fill_user_form(invalid_user)
    click_button "Register"
  end
end


def fill_user_form(user)
  fill_in "Name",                  with: user.name
  fill_in "Email",                 with: user.email
  fill_in "Password",              with: user.password
  fill_in "Password confirmation", with: user.password_confirmation
end

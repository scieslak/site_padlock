require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest

  test "user should register providing valid information" do
    visit new_user_path
    fill_user_form_as(valid_user)
    click_button "Register"

    assert_equal user_path(User.last.reload.id), current_path
    assert page.has_no_css?('form#new_user')
  end

  test "user should not register without valid information" do
    visit new_user_path
    fill_user_form_as(invalid_user)
    click_button "Register"

    refute_equal user_path(User.last.reload.id), current_path
    assert page.has_css?('form#new_user')

  end
end

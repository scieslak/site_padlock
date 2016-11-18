require 'test_helper'

class UserSigninTest < ActionDispatch::IntegrationTest
  test "user can sign in" do
    visit root_path
  end
end

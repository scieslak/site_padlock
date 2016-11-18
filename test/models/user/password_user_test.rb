# Password validations tests

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    setup_model_test
  end

  test "password should be present" do
    new_user = User.new(name: "John",
                        email: "smith@ex.com",
                        password: nil)
    assert new_user.new_record?
    assert_not new_user.valid?
  end

  test "password can be blank when updating profile" do
    @user.password = ""
    assert_not @user.new_record?
    assert @user.valid?
  end

  test "password should have minimum 6 characters" do
    @user.password = "p" * 5
    assert_not @user.valid?
  end

  test "matching paswword and confirmation should be valid" do
    @user.password = @user.password_confirmation = "password"
    assert @user.valid?
  end

  test "not matching password and confirmation should not be valid" do
    @user.password = "password"
    @user.password_confirmation = "PASSWORD"
    assert_not @user.valid?
  end

  test "password without confirmaton should be not valid" do
    @user.password = "password"
    @user.password_confirmation =""
    assert_not @user.valid?
  end
end

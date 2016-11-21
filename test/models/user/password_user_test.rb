# Opens UserTest class and adds password validations tests.
# =============================================================================

class UserTest < ActiveSupport::TestCase

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "password can be blank when updating profile" do
    # Pull existing user from fixtures
    @user = users(:one)
    @user.password = ""
    @user.password_confirmation = ""
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

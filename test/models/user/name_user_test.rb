# Opens UserTest class and adds name validations tests.
# =============================================================================

class UserTest < ActiveSupport::TestCase

  test "name must be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should contain minimum 3 characters" do
    @user.name = "uu"
    assert_not @user.valid?
  end

  test "name should contain maximum 50 characters" do
    @user.name = "u" * 51
    assert_not @user.valid?
  end

end

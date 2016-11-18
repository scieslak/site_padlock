# Name validations tests

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "user should not be valid" do
    assert @user.valid?
  end

end

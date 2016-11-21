require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = valid_user
  end

  test "user should be valid" do
    assert @user.valid?
  end

end

#=================================================
# For column specific validation tests see:
#
# user/name_user_test.rb
# user/email_user_test.rb
# user/passowrd_user_test.rb

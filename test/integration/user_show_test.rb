require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end


  test "can view all users" do
   get users_path
  end

  test "user can view own profile" do
    get user_path(@user)
    assert_select "h1", @user.name
  end

end

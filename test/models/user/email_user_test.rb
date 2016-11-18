# Email validations tests

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    setup_model_test
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "email should not be  longer than 255 characters" do
    domain = "@example.com"
    @user.email = "u" * (256 - domain.length) + domain
    assert_not @user.valid?
  end

  test "ivalid email should not pass the validation" do
    invalid_addresses = %w[exa\ mple@example.com
                           exa,mple@example.com
                           exa!mple@example.com
                           exa\ mple,exa!mple@example.com
                           exa_mple_at_example.com
                           example@example\ com
                           example@example,com
                           eample@exa_mple.com
                           example@example.c
                           exa\ mple,exa!mple_at_exa_mple.c]

    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address} should not be valid!"
    end
  end

  test "valid email should pass the validation" do
    valid_addresses = %w[example@example.com
                         exa-mple@example.com
                         exa.mple@example.com
                         exa_mple@example.com
                         exa+mple@example.com
                         123example@example.com
                         eXample@example.com
                         123eXa+mple.exa_mple-exa+mple@example.com
                         example@exa-mple.com
                         example@123example.example.com
                         example@eXample.com
                         123eXa+mple.exa_mple-exa+mple@123.eX-ample.com]

    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address} should be valid!"
    end
  end

  test "email should be stored downcase" do
    mix_case_email = "ExAmPlE@ExAmPlE.CoM"
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase, @user.reload.email
  end

  test "email should be unique" do
    @user.save
    @another_user.email = @user.email
    assert_not @another_user.valid?
  end

end

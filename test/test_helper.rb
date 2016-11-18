# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'simplecov'
require "codeclimate-test-reporter"

if ENV["COVERAGE"]
  SimpleCov.start do
    add_filter "/config/"
    add_filter "/test/"
  end
  ENV['CODECLIMATE_REPO_TOKEN'] = ENV['CODECLIMATE_SITE_PADLOCK']
  CodeClimate::TestReporter.start
end

require "minitest/reporters"
Minitest::Reporters.use!

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

require 'capybara/rails'
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

#==============================================================================#

def setup_model_test
  @user = users(:one)
  @another_user = users(:two)
  @user.password = 'password'
end

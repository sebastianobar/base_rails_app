ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    set_fixture_class users_profiles: Users::Profile

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Devise test helpers for controller/integration tests
    include Devise::Test::IntegrationHelpers

    # Add more helper methods to be used by all tests here...
  end
end

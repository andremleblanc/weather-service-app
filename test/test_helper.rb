ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'vcr'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { match_requests_on: %i[method host path] }
  config.filter_sensitive_data('<GOOGLE_MAPS_API_KEY>') { Rails.application.credentials.google.maps_api_key }
  config.filter_sensitive_data('<WEATHER_API_KEY>') { Rails.application.credentials.weather_api_key }
  config.ignore_localhost = true
end

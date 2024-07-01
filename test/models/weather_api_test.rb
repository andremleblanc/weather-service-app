require "test_helper"

class WeatherApiTest < ActiveSupport::TestCase
  test "call returns the forecast payload" do
    VCR.use_cassette("weather_service_test") do
      response = WeatherApi.call(zip_code: "33713")
      assert response.success?
      assert response.current
      assert response.forecast
    end
  end
end

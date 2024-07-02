require 'test_helper'

class WeatherApiTest < ActiveSupport::TestCase
  test 'call returns a Response' do
    VCR.use_cassette('models/weather_api/call') do
      response = WeatherApi.call(zip_code: '33713')
      assert response.success?
      assert response.current
      assert response.forecast
    end
  end
end

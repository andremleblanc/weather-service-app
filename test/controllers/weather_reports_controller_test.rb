require 'test_helper'

class WeatherReportsControllerTest < ActionDispatch::IntegrationTest
  test '#new is successful' do
    get new_weather_report_url
    assert_response :success
  end

  test 'create with zip_code redirects' do
    zip_code = '33713'
    post weather_reports_url, params: { zip_code: }
    assert_redirected_to weather_report_url(zip_code)
  end

  test 'show is successful' do
    VCR.use_cassette('controllers/weather_reports/show') do
      zip_code = '33713'
      get weather_report_url(zip_code:)
    end
  end
end

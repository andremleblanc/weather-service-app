require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  test "#new is successful" do
    get new_forecast_url
    assert_response :success
  end

  test "create with zip_code redirects" do
    zip_code = "33713"
    post forecasts_url, params: { zip_code: }
    assert_redirected_to forecast_url(zip_code)
  end

  test "show is successful" do
    VCR.use_cassette("controllers/forecasts/show") do
      zip_code = "33713"
      get forecast_url(zip_code:)
    end
  end
end

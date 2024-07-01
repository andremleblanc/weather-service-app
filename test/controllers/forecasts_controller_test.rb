require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  test "#new is successful" do
    get new_forecast_url
    assert_response :success
  end

  test "create with no zip attemps lookup" do
    # Probably handle in model
    assert false
  end

  test "create with zip_code redirects" do
    zip_code = "33713"
    post forecasts_url, params: { autocomplete_zip_code: zip_code }
    assert_redirected_to forecast_url(zip_code)
  end

  test "create with lat/long redirects" do
    assert false
  end

  test "show is successful" do
    zip_code = "33713"
    get forecast_url(zip_code)
  end
end

require "application_system_test_case"

class WeatherLookupTest < ApplicationSystemTestCase
  test "a user gets a weather forecast" do
    VCR.use_cassette("system/weather_lookup/get") do
      zip_code = 33713

      visit root_url
      assert_selector "h1", text: I18n.t("forecasts.new.title")

      fill_in I18n.t("forecasts.new.zip_code"), with: zip_code
      click_on I18n.t("forecasts.new.submit")

      assert_selector "h1", text: I18n.t("forecasts.show.title", zip_code:)
    end
  end
end

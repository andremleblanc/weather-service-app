require "application_system_test_case"

class WeatherReportTest < ApplicationSystemTestCase
  test "a user gets a weather report" do
    VCR.use_cassette("system/weather_lookup/get") do
      zip_code = 33713

      visit root_url
      assert_selector "h1", text: I18n.t("weather_reports.new.title")

      fill_in I18n.t("weather_reports.new.zip_code"), with: zip_code
      click_on I18n.t("weather_reports.new.submit")

      assert_selector "h1", text: I18n.t("weather_reports.show.title", zip_code:)
    end
  end
end

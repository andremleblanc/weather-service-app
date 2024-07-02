class WeatherReport
  attr_reader :weather_api_response, :zip_code

  delegate :cache_hit?, :current, :forecast, :success?, :updated_at, to: :weather_api_response

  def initialize(zip_code:, latitude: nil, longitude: nil)
    @zip_code = zip_code
    @weather_api_response = WeatherApi.call(zip_code:)
  end

  def window
    WeatherApi::FORECAST_DAYS
  end
end

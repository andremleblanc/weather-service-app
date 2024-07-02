# WeatherReport is a thin wrapper around the WeatherApi class. The separation
# allows WeatherApi to focus solely on interacting with the API, while this
# class provides an interface for the frontend to consume.

class WeatherReport
  attr_reader :weather_api_response, :zip_code

  delegate :cache_hit?, :current, :forecast, :success?, :updated_at, to: :weather_api_response

  def initialize(zip_code:)
    @zip_code = zip_code
    @weather_api_response = WeatherApi.call(zip_code:)
  end
end

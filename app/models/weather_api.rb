class WeatherApi
  FORECAST_DAYS = 3

  attr_reader :zip_code

  def self.call(zip_code:)
    new(zip_code).call
  end

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def call
    uri_string = "http://api.weatherapi.com/v1/forecast.json?key=#{Rails.application.credentials.weather_api_key}&q=#{zip_code}&days=#{FORECAST_DAYS}&aqi=no&alerts=no"
    uri = URI(uri_string)
    response = Net::HTTP.get_response(uri)
    Response.new(response)
  end

  class Response
    attr_reader :current, :forecast, :success

    def initialize(response)
      @success = response.is_a?(Net::HTTPSuccess)
      @current = {}
      @forecast = []
    end

    def success?
      success
    end
  end
end

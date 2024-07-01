class WeatherService
  attr_reader :zip_code

  def self.call(zip_code:)
    new(zip_code).call
  end

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def call
    uri = URI("http://api.weatherapi.com/v1/forecast.json?key=#{Rails.application.credentials.weather_api_key}&q=33713&days=1&aqi=no&alerts=no")
  end
end

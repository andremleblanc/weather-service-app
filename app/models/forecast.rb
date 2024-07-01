class Forecast
  attr_reader :latitude, :longitude, :zip_code

  # def self.create(params)
  #   new(**params).create
  # end

  # def self.find_or_create_by(params)
  #   new(**params)
  # end

  def initialize(zip_code:, latitude: nil, longitude: nil)
    # @latitude = latitude
    # @longitude = longitude
    @zip_code = zip_code
  end

  # def create
  #   # Retreive and cache forecast
  #   # self
  # end

  def current
    forecast.current
  end

  def daily
    weather.forecast
    # [
    #   {
    #     high:,
    #     low:,
    #     date,
    #   }
    # ]
  end

  # def weather_service_response
  #   data = Rails.cache.fetch("#{cache_key}/#{__method__}/#{zip_code}", expires_in: CACHE_EXPIRY)

  #   if data
  #     @cached = true
  #   else
  #     data = Rails.cache.fetch("#{cache_key}/#{__method__}/#{zip_code}", expires_in: CACHE_EXPIRY) do
  #       WeatherService.new(zip_code:).call
  #     end
  #   end

  #   data
  # end

  # def fetch_forecast_data
  #   # Handle having lat/long
  #   # Get (and cache) forecast from API
  # end
end

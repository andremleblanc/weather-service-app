# WeatherApi provides an interface to the underlying API for fetching
# forecasting data. The primary interaction point is the .call method,
# which returns a WeatherApi::Response object for further use.

require "uri"
require "net/http"

class WeatherApi
  CACHE_EXPIRY = 30.minutes
  CACHE_KEY = "weather_api_responses".freeze
  FORECAST_DAYS = 3

  attr_reader :zip_code

  def self.call(zip_code:)
    new(zip_code).call
  end

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def call
    cache_hit = false

    api_response = Rails.cache.fetch("#{CACHE_KEY}/#{zip_code}", expires_in: CACHE_EXPIRY)

    if api_response
      cache_hit = true
    else
      uri_string = "http://api.weatherapi.com/v1/forecast.json?key=#{Rails.application.credentials.weather_api_key}&q=#{zip_code}&days=#{FORECAST_DAYS}&aqi=no&alerts=no"
      uri = URI(uri_string)

      api_response = Rails.cache.fetch("#{CACHE_KEY}/#{zip_code}", expires_in: CACHE_EXPIRY) do
        Net::HTTP.get_response(uri)
      end
    end

    Response.new(cache_hit:, response: api_response)
  end

  class Response
    attr_reader :current, :forecast, :updated_at

    def initialize(cache_hit:, response:)
      @cache_hit = cache_hit
      @success = response.is_a?(Net::HTTPSuccess)

      return unless @success

      data = JSON.parse(response.body)
      @current = data["current"]
      @forecast = data["forecast"]["forecastday"].map { |e| { "date" => e["date"], "data" => e["day"] } }
      @updated_at = data["current"]["last_updated"].to_time
    end

    def cache_hit?
      @cache_hit
    end

    def success?
      @success
    end
  end
end

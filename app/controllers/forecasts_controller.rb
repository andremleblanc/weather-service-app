class ForecastsController < ApplicationController
  def new
  end

  def create
    # @forecast = Forecast.new(forecast_params)
    redirect_to forecast_path(@forecast.zip_code)
  end

  def show
    @forecast = Forecast.new(zip_code: params[:zip_code])
  end

  private

  def forecast_params
    {
      latitude: params[:autocomplete_latitude],
      longitude: params[:autocomplete_longitude],
      zip_code: params[:autocomplete_zip_code]
    }
  end
end

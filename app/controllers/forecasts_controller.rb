class ForecastsController < ApplicationController
  def new
  end

  def create
    redirect_to forecast_path(params[:zip_code])
  end

  def show
    @forecast = Forecast.new(zip_code: params[:zip_code])
  end
end

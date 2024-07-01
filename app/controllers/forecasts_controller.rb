class ForecastsController < ApplicationController
  def new
  end

  def create
    @forecast = nil
    redirect_to forecast_path("33713")
  end

  def show
    @zip_code = params[:zip_code]
  end
end

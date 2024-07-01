class ForecastsController < ApplicationController
  def new
  end

  def create
    @forecast = nil
    redirect_to forecast_path("33713")
  end

  def show
  end
end

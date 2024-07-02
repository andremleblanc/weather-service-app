class WeatherReportsController < ApplicationController
  def new; end

  def create
    redirect_to weather_report_path(params[:zip_code])
  end

  def show
    @weather_report = WeatherReport.new(zip_code: params[:zip_code])
  end
end

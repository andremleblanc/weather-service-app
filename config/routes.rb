Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :weather_reports, only: %i[new create show], param: :zip_code

  root "weather_reports#new"
end

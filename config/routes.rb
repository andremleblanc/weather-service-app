Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :forecasts, only: [:new, :create, :show], param: :zip_code

  root "forecasts#new"
end

Rails.application.routes.draw do
  root "historics#index"

  resources :historics

  resources :exchange_rate do
    get :latest_rate, on: :collection
    get :historical_rates, on: :collection
  end
end

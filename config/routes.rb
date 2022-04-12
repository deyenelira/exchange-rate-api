Rails.application.routes.draw do
  resources :historics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exchange_rate do
    get :latest_rate, on: :collection
    get :historical_rates, on: :collection
  end
end

Rails.application.routes.draw do
  root to: "items#index"

  resources :items
  resources :bookings
  devise_for :users
end

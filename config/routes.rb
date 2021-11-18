Rails.application.routes.draw do
  root to: "items#index"

  resources :items
  resources :bookings
  resources :payments
  devise_for :users
  
end

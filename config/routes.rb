Rails.application.routes.draw do
  root to: "items#landings_page"

  resources :items
  resources :bookings
  resources :payments
  devise_for :users
  
end

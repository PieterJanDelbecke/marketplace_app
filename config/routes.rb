Rails.application.routes.draw do
  root to: "bookings#index"

  resources :items
  devise_for :users
end

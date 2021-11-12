Rails.application.routes.draw do
  root to: "bookings#index"
  devise_for :users
end

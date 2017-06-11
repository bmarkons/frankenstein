Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :comments
  resources :room_reservations
  resources :rooms
  resources :accommodation_types
  resources :accommodations
  resources :places
  resources :regions
  resources :countries
end

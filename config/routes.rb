Rails.application.routes.draw do
  resources :room_reservations
  resources :rooms
  resources :accommodation_types
  resources :accommodations
  resources :places
  resources :regions
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

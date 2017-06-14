Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  scope module: 'admin', path: 'admin' do
    resources :countries
    resources :regions
    resources :places
    resources :accommodation_types
  end

  resources :comments
  resources :room_reservations
  resources :accommodations do
    get "my", on: :collection, as: :my
    resources :rooms, on: :member
  end
end

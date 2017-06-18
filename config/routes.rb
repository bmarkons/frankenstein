Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  scope module: 'admin', path: 'admin' do
    resources :countries
    resources :regions
    resources :places
    resources :accommodation_types
    get "/users", to: "users#index", as: "managers"
    post "/toggle_block_manager/:id", to: "users#toggle_block_manager", as: "toggle_block_manager"
  end

  resources :comments, :except => [:show, :new, :create]
  resources :room_reservations, :only => [:index, :show, :destroy]
  resources :accommodations do
    get "my", on: :collection, as: :my
    post "approve", on: :member, as: :approve
    resources :rooms, on: :member do
      resources :room_reservations, :except => [:index, :edit, :update, :show, :destroy]
    end
    resources :comments, on: :member do
      post "grade", on: :member, as: :grade
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :artists, only: [:show, :edit, :update, :destroy]
  resources :ads, only: [:new, :create, :edit, :update, :destroy]
  resources :bookings, only: [:index, :show, :create, :update] do
    member do
      patch 'approve'
      patch 'reject'
      post 'rate'
    end
  end
  resources :stages, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:index, :create]
  end

get '/dashboard', to: 'dashboard#dashboard'
get '/search', to: 'artists#search'
get '/search', to: 'stages#search'
get '/search', to: 'ads#search'
get '/map', to: 'map#show'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

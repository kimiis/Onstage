Rails.application.routes.draw do
  get 'artist/index'
  get 'artist/show'
  get 'artist/edit'
  get 'artist/update'
  get 'artist/destroy'
  devise_for :users
  root to: "pages#home"

  resources :artists, only: [:show, :edit, :update, :destroy, :index ]
  resources :ads, only: [:new, :create, :edit, :update, :destroy]
  resources :bookings, only: [:index, :show, :update]
  # do
    # member do
    #   patch 'approve'
    #   patch 'reject'
    #   post 'rate'
    # end
  resources :stages, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

get '/dashboard', to: 'dashboard#dashboard'
get '/search', to: 'searches#search'
# get '/search_artists', to: 'artists#search'
# get '/search_stages', to: 'stages#search'
# get '/search', to: 'ads#search'
get '/map', to: 'map#show'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

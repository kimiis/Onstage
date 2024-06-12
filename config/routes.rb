Rails.application.routes.draw do
  get 'map/show'

  devise_for :users
  root to: "pages#home"

  resources :artists, only: [:show, :edit, :update, :destroy, :index ] do
    member do
      get :news
      get :photos
      get :plannings
      get :aboutUs
    end
  end

  resources :bookings, only: [:index, :show, :update]
  # do
  # member do
  #   patch 'approve'
  #   patch 'reject'
  #   post 'rate'
  # end
  resources :stages, only: [:index, :show] do
    resource :conversation, only: :create
    member do
      get :news
      get :photos
      get :plannings
      get :aboutUs
    end
    resources :bookings, only: [:create]
  end

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end
# resources :artist_ads
# resources :stage_ads

resources :ads, only: [:index, :show, :edit, :update, :destroy] do
  collection do
    get 'new_artist_ad', to: 'ads#new_artist_ad'
    post 'create_artist_ad', to: 'ads#create_artist_ad'
    get 'new_stage_ad', to: 'ads#new_stage_ad'
    post 'create_stage_ad', to: 'ads#create_stage_ad'
    get 'artist_ads', to: 'ads#artist_ads'
    get 'stage_ads', to: 'ads#stage_ads'
  end
end

# get "/ artist_ads", to: "ads#artist_ads"
# get "/artist_ads/", to: "ads#artist_ads"
# get "/stage_ads", to: "ads#stage_ads"
get '/dashboard', to: 'dashboard#dashboard'
get '/search', to: 'searches#search'
get '/map', to: 'map#show'
get '/components', to: 'pages#components'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

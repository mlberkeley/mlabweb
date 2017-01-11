Rails.application.routes.draw do
  root 'pages#home'

  # Static pages routes
  get '/about', to: 'pages#about'
  get '/portfolio', to: 'pages#portfolio'
  get '/connections', to: 'pages#connections'
  get '/updates', to: 'pages#updates'
  get '/legal', to: 'pages#legal'

  # Member routes
  get '/create', to: 'members#new'
  post '/create', to: 'members#create'
  resources :members
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Application routes
  get '/apply', to: 'apply_pages#index'
  get '/apply/member', to: 'apply_pages#member'
  get '/apply/client', to: 'apply_pages#client'

  # Newsletter Subscription routes
  get '/subscribe', to: 'subscribers#new'
  post '/subscribe', to: 'subscribers#create'

  # Project routes
  get '/newproject', to: 'projects#new'
  post '/newproject', to: 'projects#create'
  resources :projects

  # Blogpost/Special routes
  resources :blogposts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :specials, only: [:new, :create, :edit, :update, :destroy]

  # Event routes
  get '/past', to: 'events#past'
  resources :events, only: :index
end

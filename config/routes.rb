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

  # Application routes
  get '/apply', to: 'apply_pages#index'
  get '/apply/member', to: 'apply_pages#member'
  get '/apply/client', to: 'apply_pages#client'
end

Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/portfolio', to: 'pages#portfolio'
  get '/connections', to: 'pages#connections'
  get '/updates', to: 'pages#updates'
  get '/legal', to: 'pages#legal'
end

Rails.application.routes.draw do
  root 'pages#home'

  # Static pages routes
  get '/about', to: 'pages#about'
  get '/portfolio', to: 'pages#portfolio'
  get '/connections', to: 'pages#connections'
  get '/updates', to: 'pages#updates'

  # Member routes
  get '/create', to: 'members#new'
  post '/create', to: 'members#create'
  resources :members do
    member do
      put 'join'
      put 'leave'
      put 'attend'
    end
  end
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
  resources :projects do
    member do
      get :members
    end
  end

  # Blogpost/Special routes
  resources :blogposts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :specials, only: [:new, :create, :edit, :update, :destroy]

  # Event routes
  get '/past', to: 'events#past'
  get '/attendance', to: 'events#attendance'
  get '/newevent', to: 'events#new'
  post '/newevent', to: 'events#create'
  resources :events do
    collection do
      put 'call_roll'
      put 'finish'
      put 'make_event'
    end
  end

  # Calendar routes
  get '/redirect', to: 'calendars#redirect', as: 'redirect'
  get '/callback', to: 'calendars#callback', as: 'callback'
  get '/calendars', to: 'calendars#calendars', as: 'calendars'
  get '/gc_events/:calendar_id', to: 'calendars#events', as: 'gc_events', calendar_id: /[^\/]+/
  post '/gc_events/:calendar_id', to: 'calendars#new_event', as: 'new_gc_event', calendar_id: /[^\/]+/
end

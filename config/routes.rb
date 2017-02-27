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
  get '/all_events', to: 'events#all'
  get '/past', to: 'events#past'
  get '/attendance', to: 'events#attendance'
  get '/newevent', to: 'events#new2'
  post '/newevent', to: 'events#create2'
  resources :events do
    collection do
      put 'call_roll'
      put 'finish'
      put 'make_event'
      put 'make_event_gcal'
    end
  end

  # Google Calendar routes
  get '/public_calendar', to: 'calendars#public_calendar'
  get '/gcal_redirect', to: 'calendars#redirect', as: 'google_calendars'
  get '/gcal_callback', to: 'calendars#callback', as: 'gcal_callback'
  get '/calendars', to: 'calendars#calendars'
  get '/gcal_events/:calendar_id', to: 'calendars#events', as: 'gcal_events', calendar_id: /[^\/]+/
  post '/gcal_events/:calendar_id', to: 'calendars#new_event', as: 'new_gc_event', calendar_id: /[^\/]+/

  # Wikifiles routes
  resources :wikifiles, only: [:index, :new, :create, :destroy]

end

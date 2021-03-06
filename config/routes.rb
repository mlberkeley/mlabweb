Rails.application.routes.draw do

  # Root
  root 'home#home'
  get '/home', to: 'home#home'
  get '/apply', to: 'landing#landing'

  # Member Routes
  devise_for :members
  resources :members
  resources :posts, only: [:create, :destroy]

  # Updates Routes
  get '/timeline', to: 'updates#timeline'
  get '/events', to: 'updates#events'
  get '/subscribe', to: 'subscribers#new'
  resources :subscribers

  # Calendars Routes
  get '/public_calendar', to: 'calendars#public_calendar'
  get '/internal_calendar', to: 'calendars#internal_calendar'

  # Education Routes
  get '/education', to: 'education#home'
  get '/decals', to: 'education#decals'
  get '/workshops', to: 'education#workshops'
  get '/rg', to: 'education#rg'
  get '/resources', to: 'education#resources'

  # Portfolio Routes
  resources :projects do
    member do
      get :members
    end
  end
  get '/portfolio', to: 'portfolio#home'

  # About Controller Routes
  get '/advisors', to: 'about#advisors'
  get '/about', to: 'about#home'
  get '/team', to: 'about#team'
  get '/newmemberfaq', to: 'about#nmo'

  # Dashboard Routes
  get '/dashboard', to: 'dashboard#home'
  get '/console', to: 'dashboard#options'

  # Legal Controller Routes
  get '/terms', to: 'legal#terms_of_service'
  get '/privacy', to: 'legal#privacy'
  get '/statement', to: 'legal#non_profit_statement'

  # Application routes
  # get '/apply', to: 'apply_pages#index'
  get '/apply/member', to: 'apply_pages#member'
  # get '/apply/client', to: 'apply_pages#client'

  # Wikifiles Routes
  resources :wikifiles, only: [:index, :new, :create, :destroy]

  # Static files
  get '/dd1', to: redirect('/dd/index.html')
  get '/careerfair', to: redirect('/mlcareerfair/')

end

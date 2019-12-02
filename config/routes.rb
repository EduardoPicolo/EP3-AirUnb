Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { sessions: 'sessions' }, :skip => :registrations
  devise_for :customers, :hosts,  controllers: { registrations: 'users/registrations'}, :skip => :sessions

  resources :spots

  get '/account-selection', to: 'pages#account_selection'
  get '/users/:id', to: 'pages#profile'
  get '/mySpots', to: 'pages#mySpots'

  mount Commontator::Engine => '/commontator'

end

Rails.application.routes.draw do
  root to: 'pages#home'
  # devise_for :users, :controllers => { :registrations => 'users/registrations' }
  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :customers, :hosts, :skip => :sessions
  resources :spots
  # resources :hosts
  # resources :customers

  get '/account-selection', to: 'pages#account_selection'
  # get '/users/sign_up?user[user_type]=customer', to: 'users/registrations#new'
  # get '/users/sign_up?user[user_type]=host', to: 'users/registrations#new'
end

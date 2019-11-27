Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :customers, :hosts, :skip => :sessions

  resources :spots

  get '/account-selection', to: 'pages#account_selection'

end

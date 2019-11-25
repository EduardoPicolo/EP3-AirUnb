Rails.application.routes.draw do
  resources :hosts
  resources :customers
  root to: 'pages#home'
  resources :spots
  # devise_for :users
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # get 'tenant/sign_up' => 'user_registrations#new', :user => { :user_type => 'tenant' }
  # get 'customer/sign_up' => 'user_registrations#new', :user => { :user_type => 'customer' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
end

Rails.application.routes.draw do
  
  devise_for :users
  root to: 'signups#index'
  
  resources :charges, only: [:new, :create]
  resources :wikis
  post 'users/downgrade', to: 'users#downgrade'
end

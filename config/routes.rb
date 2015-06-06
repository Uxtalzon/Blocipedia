Rails.application.routes.draw do
  
  devise_for :users
  root to: 'signups#index'
  
  resources :charges, only: [:new, :create]
  resources :wikis
end

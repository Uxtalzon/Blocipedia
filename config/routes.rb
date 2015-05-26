Rails.application.routes.draw do
  
  devise_for :users
  root to: 'signups#index'
  
  resources :wikis
end

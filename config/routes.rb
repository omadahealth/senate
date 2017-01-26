Rails.application.routes.draw do
  resources :elastic_searches
  resources :redis
  resources :postgresqls
  resources :secrets
  resources :application_environments
  resources :environments
  resources :applications
  devise_for :users
  root to: "home#index"
end

Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams, only: [:create, :destroy]
  get '/:slug', to: 'teams#show'
  resources :channels, only: [:show, :create, :destroy]
  resources :talks, only: [:show]
  resources :teams_users, only: [:create, :destroy]
  devise_for :users, controllers => { registrations: 'registrations' }
end

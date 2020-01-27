Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :ranks 
  resources :constellations 
  resources :effects
  resources :characters do
    resources :stats
    resources :skills
    resources :cosmos_sets
    get 'search', on: :collection
  end
  resources :banners, only: %i[index new create show]

  resources :cosmo_basics
  resources :cosmo_types
  resources :cosmos
  get '/cosmos/all', to: 'cosmos#all'
end

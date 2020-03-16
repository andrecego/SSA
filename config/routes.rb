# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/summon', to: 'home#summon'

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
  get 'eighth_sense', to: 'home#eighth_sense'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'summon/markers', to: 'summon#markers'
      get 'summon/random', to: 'summon#random'
    end
  end
end

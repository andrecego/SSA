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
  end

  resources :cosmo_types do
    resources :cosmos
  end
end

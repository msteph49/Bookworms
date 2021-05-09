# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'
  get "user", to: "user#index"
  resources :genres
  resources :reviews
  resources :revies
  resources :authors
  resources :books
  
  
end

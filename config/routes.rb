Rails.application.routes.draw do
  devise_for :users
  resources :genres, only: [:index, :new, :create]
  resources :users, only: [:show, :edit, :update]
  root to: 'users#show'
end

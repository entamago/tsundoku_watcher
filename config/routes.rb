Rails.application.routes.draw do
  devise_for :users
  resources :genres
  resources :users, only: [:show, :edit, :update]
  root to: 'users#show'
end

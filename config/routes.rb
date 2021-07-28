Rails.application.routes.draw do
  devise_for :users
  resources :genres, only: :index
  root to: 'genres#index'
end

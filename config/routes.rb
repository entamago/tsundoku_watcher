Rails.application.routes.draw do
  devise_for :users
  resources :genres do
    resources :articles, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update]
  root to: 'users#show'
end

Rails.application.routes.draw do
  devise_for :users
  resources :genres do
    resources :articles, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  resources :users, only: [:show, :edit, :update]
  get 'search' => 'articles#search'

  root to: 'users#show'
end

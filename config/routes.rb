Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', :to => "users/sessions#new_guest"
  end

  resources :genres do
    resources :articles, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  resources :users, only: [:show, :edit, :update]
  get 'search' => 'articles#search'
  resources :goals, only: [:index, :new, :create, :edit, :update, :destroy]

  root to: 'users#show'
end

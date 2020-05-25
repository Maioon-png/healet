Rails.application.routes.draw do
  
  devise_for :users
  root 'top#index'
  resources :users, only: :index
  resources :weights, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :meals, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :topics, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  resources :tags, only: [:index, :show]

end

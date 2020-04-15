Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: :index
  resources :weights, only: :index
end

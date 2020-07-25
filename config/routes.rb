Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'top#index'
  resources :users, only: [:index, :show]
  resources :weights, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :meals, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :topics, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :tags, only: [:index, :show]
 

end

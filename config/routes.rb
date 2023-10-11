Rails.application.routes.draw do
  devise_for :users
  # Root route
  root 'users#index'

  # Define resources for users, posts, comments, and likes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end

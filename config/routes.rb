Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:show, :index] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end 
  end
  # resources :posts, only: [:new, :create] do
  #   resources :comments, only: [:new, :create]
  #   resources :likes, only: [:create]
  # end
end

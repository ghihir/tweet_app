Rails.application.routes.draw do
  root to: "posts#index"
  get "/login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :posts
  resources :users

  namespace :admin do
    root to: "posts#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :staffs
    resources :posts, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end
 end
 
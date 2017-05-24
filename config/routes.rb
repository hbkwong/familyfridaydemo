Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :lunches, only: [:create, :show]
  resources :restaurants, only: [:create]
  resources :reviews, only: [:create, :new, :show]
end

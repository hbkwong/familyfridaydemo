Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :lunches, only: [:create, :show]
  resources :restaurants, only: [:create]
  resources :reviews, only: [:new, :show]
  get 'reviews' => 'reviews#create'
end

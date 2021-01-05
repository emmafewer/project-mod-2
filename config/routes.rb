Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments
  end
  devise_for :users
  root to: "posts#index"
  resources :pets
  resources :species
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  
end

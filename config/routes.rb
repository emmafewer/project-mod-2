Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments
  end
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/user/:id', to: 'users#show', as: 'show_user'
  end

  root to: "posts#index"
  resources :pets
  resources :species
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  
end

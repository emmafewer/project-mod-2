Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments
  end
  patch '/posts/:id/add_likes', to: 'posts#add_likes', as:'add_likes'
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/user/:id', to: 'users#show', as: 'show_user'
  end

  root to: "posts#index"
  resources :pets
  resources :species
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get '/search', to: "posts#search"
  get '/about', to: "posts#about"
  
end

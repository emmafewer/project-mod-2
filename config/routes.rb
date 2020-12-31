Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  resources :pets
  resources :species
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get '/', to: 'posts#index', as: 'home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end

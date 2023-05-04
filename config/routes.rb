Rails.application.routes.draw do
  get 'rooms/index'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :rooms do
    resources :messages
  end
  root 'rooms#index'
end

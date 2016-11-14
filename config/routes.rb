Rails.application.routes.draw do
  devise_for :users
  resources :utensils
  resources :eatables
  resources :users
  resources :instructions
  resources :ingredients
  resources :recipes
  root 'pages#index'
end

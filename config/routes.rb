Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do 

  get '/users/sign_out', to: 'devise/sessions#destroy'

  get '/inventories/:id/test_method', to: 'inventories#test_method', as: 'test_method'
  post '/inventories/:id/add_food_item', to: 'inventories#add_food_item', as: 'add_food_item'
  resources :recipes
  resources :recipe_foods
  resources :foods
  resources :inventory_foods
  resources :inventories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
  end
end

Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do 

  get '/users/sign_out', to: 'devise/sessions#destroy'

  get '/inventories/:id/show_inventory_foods', to: 'inventories#show_inventory_foods', as: 'show_inventory_foods'

  post '/inventories/:id/add_food_item', to: 'inventories#add_food_item', as: 'add_food_item'
  
  get '/shopping_list', to: 'shopping_list#show', as: 'shopping_list'
 
    post '/recipes/:id/', to: 'recipes#toggle_public', as: 'toggle_public'

    get '/recipes/:id/show_list_of_foods', to: 'recipes#show_recipe_foods', as: 'show_list_of_foods'

    post '/recipes/:id/add_food_item', to: 'recipes#add_food_item', as: 'add_recipe_food_item'

  resources :recipes do
    resources :foods, only: [:new, :create, :show], as: 'specific_foods'
  end
  resources :recipe_foods
  resources :foods
  resources :inventory_foods
  resources :inventories do
    resources :foods, only: [:new, :create, :show], as: 'specific_foods'
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
  end
end

Rails.application.routes.draw do
  resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  get 'general_shopping_list', to: 'user#shopping_list'
  get 'public_recipes', to: 'recipes#publics'

  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
end

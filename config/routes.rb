Rails.application.routes.draw do
  resources :general_shopping_list, only: [:index], controller: 'recipe_foods'

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    get 'publics', on: :collection
  end

  resources :foods, only: [:index, :show, :new, :create, :destroy]

  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
end

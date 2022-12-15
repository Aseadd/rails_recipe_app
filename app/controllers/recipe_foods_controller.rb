class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /general_shopping_list or /general_shopping_list.json
  def index
    @recipes = current_user.recipes
  end
end

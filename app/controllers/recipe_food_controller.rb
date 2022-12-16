class RecipeFoodController < ApplicationController
  # before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /recipe_food or /recipe_food.json
  def index
    @recipes = current_user.recipes
  end

  # DELETE /recipe_food/1 or /recipe_food/1.json
  def destroy
    recipe_food = RecipeFood.find params[:id]

    recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Ingredients was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

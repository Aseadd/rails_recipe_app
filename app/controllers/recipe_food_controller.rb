class RecipeFoodController < ApplicationController
  # before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /recipe_food or /recipe_food.json
  def index
    @recipes = current_user.recipes
  end

  def create
    puts recipe_food_params[:recipe_id]

    amount = recipe_food_params[:amount]
    recipe = Recipe.find recipe_food_params[:recipe_id]
    food = Food.find recipe_food_params[:food_id]

    recipe_food = RecipeFood.new(
      amount:,
      food:,
      recipe:
    )

    respond_to do |format|
      if recipe_food.save
        format.html { redirect_to recipe_path(recipe), notice: 'Ingredient successfully Added.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
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

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(
      :amount,
      :recipe_id,
      :food_id
    )
  end
end

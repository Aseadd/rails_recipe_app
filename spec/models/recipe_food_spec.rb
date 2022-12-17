require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let!(:user) do
    User.create(
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
    )
  end

  let!(:food) do
    Food.new(
      name: 'Tomatoes',
      unit: 'piece',
      price: '1.1',
      quantity: 0,
      user:
    )
  end

  let!(:recipe) do
    Recipe.create(
      name: 'test',
      preparation_time_seconds: 10.minute.second,
      cooking_time_seconds: 5.minute.second,
      description: 'desciption test recipe',
      public: true,
      user:
    )
  end

  let!(:recipe_food) do
    RecipeFood.create(
      amount: 1,
      food:,
      recipe:
    )
  end

  it 'valid with all correct atributes' do
    expect(recipe_food).to be_valid
  end

  it 'invalid if amount is nill' do
    recipe_food.amount = nil
    expect(recipe_food).to_not be_valid
  end
  it 'invalid if food is nill' do
    recipe_food.food = nil
    expect(recipe_food).to_not be_valid
  end
  it 'invalid if recipe is nill' do
    recipe_food.recipe = nil
    expect(recipe_food).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  let!(:user) do
    User.create(
      name: 'test user',
      email: 'test@test.com',
      password: 'testpass'
    )
  end

  let!(:food_A) do
    Food.create(
      name: 'food A test name',
      unit: 'milliliter',
      price: '1111.11111',
      quantity: 222_222_222,
      user:
    )
  end

  let!(:food_B) do
    Food.create(
      name: 'food B test name',
      unit: 'milliliter',
      price: '3333.3333',
      quantity: 444_444_444,
      user:
    )
  end

  let!(:recipe) do
    Recipe.create(
      name: "#{user.name} test recipe name",
      preparation_time_seconds: 10.minute.second,
      cooking_time_seconds: 5.minute.second,
      description: 'test recipe description',
      public: true,
      user:
    )
  end

  let!(:ingredints) do
    [
      RecipeFood.create(
        amount: 9999,
        food: food_A,
        recipe:
      ),
      RecipeFood.create(
        amount: 9999,
        food: food_B,
        recipe:
      )
    ]
  end

  before :each do
    sign_in user

    assign(:recipe, recipe)
    assign(:ingredients, recipe.recipeFood)

    render
  end

  describe 'renders a recipe attributes' do
    it 'render recipe name' do
      expect(rendered).to match(/#{recipe.name}/)
    end

    it 'render recipe preparation time in minutes' do
      expect(rendered).to match(/#{recipe.preparation_time_seconds.second.in_minutes}/)
    end

    it 'render recipe cooking time minutes' do
      expect(rendered).to match(/#{recipe.cooking_time_seconds.second.in_minutes}/)
    end

    it 'render recipe description' do
      expect(rendered).to match(/#{recipe.description}/)
    end

    it 'render recipe public' do
      expect(rendered).to match(/public/)
    end

    it 'render recipe author' do
      expect(rendered).to match(/#{recipe.user.name}/)
    end
  end

  describe 'renders a recipe ingredients' do
    it 'render all ingredints name' do
      ingredints.each do |ingredint|
        expect(rendered).to match(/#{ingredint.food.name}/)
      end
    end

    it 'render all ingredints amount' do
      ingredints.each do |ingredint|
        expect(rendered).to match(/#{ingredint.amount}/)
      end
    end

    it 'render all ingredints unit' do
      ingredints.each do |ingredint|
        expect(rendered).to match(/#{ingredint.food.unit}/)
      end
    end
  end
end

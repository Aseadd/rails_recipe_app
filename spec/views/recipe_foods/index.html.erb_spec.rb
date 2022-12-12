require 'rails_helper'

RSpec.describe 'recipe_foods/index', type: :view do
  let!(:food) { Food.create(name: 'food name',user: User.create) }
  let!(:recipe) { Recipe.create(name: 'recipe name',user: User.create) }

  before(:each) do
    assign(:recipe_foods, [
             RecipeFood.create!(
               quantity: 2,
               food:,
               recipe:
             ),
             RecipeFood.create!(
               quantity: 2,
               food:,
               recipe:
             )
           ])
  end

  it 'renders a list of recipe_foods' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(food.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(recipe.id.to_s), count: 2
  end
end

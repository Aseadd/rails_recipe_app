require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  let(:recipe) do
    Recipe.create!(
      name: 'MyString',
      preparation_time_seconds: 1,
      cooking_time_seconds: 1,
      description: 'MyText',
      public: false,
      user: User.create
    )
  end

  before(:each) do
    assign(:recipe, recipe)
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time_seconds]'

      assert_select 'input[name=?]', 'recipe[cooking_time_seconds]'

      assert_select 'textarea[name=?]', 'recipe[description]'

      assert_select 'input[name=?]', 'recipe[public]'

      assert_select 'input[name=?]', 'recipe[user_id]'
    end
  end
end
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:user) do
    User.create(
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
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

  it 'valid with all correct atributes' do
    expect(recipe).to be_valid
  end

  it 'invalid if name is nil' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end
  it 'invalid if preparation_time_seconds is nil' do
    recipe.preparation_time_seconds = nil
    expect(recipe).to_not be_valid
  end
  it 'invalid if cooking_time_seconds is nil' do
    recipe.cooking_time_seconds = nil
    expect(recipe).to_not be_valid
  end
  it 'invalid if description is nil' do
    recipe.description = nil
    expect(recipe).to_not be_valid
  end
  it 'invalid if public is nil' do
    recipe.public = nil
    expect(recipe).to_not be_valid
  end
  it 'invalid if user is nil' do
    recipe.user = nil
    expect(recipe).to_not be_valid
  end
end

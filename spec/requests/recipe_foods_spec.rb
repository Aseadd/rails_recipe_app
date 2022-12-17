require 'rails_helper'

RSpec.describe '/general_shopping_list', type: :request do

  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'ruth', email: 'ruth@mail.com', password: '12345678') }
  let(:recipe_food) { user.recipe_foods.create(name: 'food A test name', unit: 'milliliter', price: '1111.11111', quantity: 2345) }
  describe 'GET /general_shopping_list' do
    before do
      sign_in user
      get recipe_food_index_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

  end
end

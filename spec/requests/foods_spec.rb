require 'rails_helper'
RSpec.describe '/foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'ruth', email: 'ruth@mail.com', password: '12345678') }
  let(:food) { user.foods(name: 'food A test name', unit: 'milliliter', price: '1111.11111', quantity: 2345) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_food_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end

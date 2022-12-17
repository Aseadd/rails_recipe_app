require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'ruth', email: 'ruth@mail.com', password: '12345678') }
  let(:recipe) do
    user.recipes.create(name: 'test recipe name', preparation_time_seconds: 10.minute.second,
                        cooking_time_seconds: 5.minute.second, description: 'test recipe description', public: true)
  end

  describe 'GET /index' do
    before do
      sign_in user
      get recipes_path
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

require 'rails_helper'

## USE FOR LOGGIN
RSpec.describe 'login', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'ruth', email: 'ruth@gmail.com', password: '12345678') }
  describe 'login' do
    before do
      sign_in user
      get root_path
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

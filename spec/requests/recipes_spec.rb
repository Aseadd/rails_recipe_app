require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  describe 'GET /index' do
    it 'renders a successful response'
  end

  describe 'GET /show' do
    it 'renders a successful response'
  end

  describe 'GET /new' do
    it 'renders a successful response'
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe'

      it 'redirects to the created recipe'
    end

    context 'with invalid parameters' do
      it 'does not create a new Recipe'

      # expect(response).to have_http_status(:unprocessable_entity)
      it "renders a response with 422 status (i.e. to display the 'new' template)"
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe'

    it 'redirects to the recipes list'
  end
end

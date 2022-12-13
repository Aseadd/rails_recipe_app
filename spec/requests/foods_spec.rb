require 'rails_helper'
RSpec.describe '/foods', type: :request do
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
      it 'creates a new Food'

      it 'redirects to the created food'
    end

    context 'with invalid parameters' do
      it 'does not create a new Food'

      it "renders a response with 422 status (i.e. to display the 'new' template)"
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested food'

    it 'redirects to the foods list'
  end
end

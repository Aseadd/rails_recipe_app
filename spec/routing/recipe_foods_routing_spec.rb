require 'rails_helper'

RSpec.describe RecipeFoodController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recipe_food').to route_to('recipe_food#index')
    end
  end
end

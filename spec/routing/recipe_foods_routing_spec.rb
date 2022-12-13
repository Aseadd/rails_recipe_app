require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/general_shopping_list').to route_to('recipe_foods#index')
    end
  end
end

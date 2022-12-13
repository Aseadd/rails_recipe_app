require 'rails_helper'

RSpec.describe 'layouts/_header', type: :view do
  before :each do
    render
  end

  context 'logged in' do
    it 'render Foods' do
      expect(rendered).to match(/Foods/)
    end

    it 'render Recipes' do
      expect(rendered).to match(/Recipes/)
    end

    it 'render Public recipes' do
      expect(rendered).to match(/Public recipes/)
    end

    it 'render shopping list' do
      expect(rendered).to match(/shopping list/)
    end

    it 'render logout'
  end

  # context 'logged out' do
  #   it 'render Foods' do
  #     expect(rendered).to_not match(/Foods/)
  #   end

  #   it 'render Recipes' do
  #     expect(rendered).to_not match(/Recipes/)
  #   end

  #   it 'render Public recipes' do
  #     expect(rendered).to_not match(/Public recipes/)
  #   end

  #   it 'render shopping list' do
  #     expect(rendered).to_not match(/shopping list/)
  #   end

  #   it 'render log in'

  #   it 'render sign in'
  # end
end

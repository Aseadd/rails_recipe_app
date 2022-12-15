require 'rails_helper'

RSpec.describe 'layouts/_header', type: :view do
  context 'logged in' do
    before :each do
      sign_in User.create(
        name: 'test user',
        email: 'test@test.com',
        password: 'testpass'
      )
      render
    end
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

    it 'render logout' do
      expect(rendered).to match(/Log out/)
    end
  end

  context 'logged out' do
    before :each do
      render
    end
    it 'render Foods' do
      expect(rendered).to_not match(/Foods/)
    end

    it 'render Recipes' do
      expect(rendered).to_not match(/Recipes/)
    end

    it 'render Public recipes' do
      expect(rendered).to_not match(/Public recipes/)
    end

    it 'render shopping list' do
      expect(rendered).to_not match(/shopping list/)
    end

    it 'render logout' do
      expect(rendered).to_not match(/Log out/)
    end

    it 'render Sign up' do
      expect(rendered).to match(/Sign up/)
    end

    it 'render Log in' do
      expect(rendered).to match(/Log in/)
    end
  end
end

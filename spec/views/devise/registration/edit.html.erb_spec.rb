require 'rails_helper'

RSpec.describe 'devise/registrations/edit', type: :view do
  let!(:user) do
    User.create(
      name: 'test user',
      email: 'test@test.com',
      password: 'testpass'
    )
  end

  before :each do
    sign_in user

    render
  end

  context 'renders edit user form page' do
    it 'render "edit User" title' do
      expect(rendered).to match(/Edit User/)
    end

    it 'ask for a Email' do
      expect(rendered).to match(/Email/)
    end

    it 'ask for a password' do
      expect(rendered).to match(/Password/)
    end
  end
end

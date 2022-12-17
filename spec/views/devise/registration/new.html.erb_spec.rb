require 'rails_helper'

RSpec.describe 'devise/registrations/new', type: :view do
  before :each do
    render
  end

  context 'renders Sign up form page' do
    it 'render "Sign up" title' do
      expect(rendered).to match(/Sign up/)
    end

    it 'ask for a Email' do
      expect(rendered).to match(/Email/)
    end

    it 'ask for a password' do
      expect(rendered).to match(/Password/)
    end
  end
end

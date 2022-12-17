require 'rails_helper'

RSpec.describe 'devise/registrations/new', type: :view do
  before :each do
    render
  end

  context 'renders Sign up form page' do
    it 'render "Sign up" title' do
      expect(rendered).to match(/Sign up/)
    end
  end
end

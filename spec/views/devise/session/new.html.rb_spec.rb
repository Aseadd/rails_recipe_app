require 'rails_helper'

RSpec.describe 'devise/sessions/new', type: :view do
  before :each do
    render
  end

  context 'renders Log in form form page' do
    it 'render "Log in form" title' do
      expect(rendered).to match(/Log in/)
    end

    it 'ask for a Email' do
      expect(rendered).to match(/Email/)
    end

    it 'ask for a password' do
      expect(rendered).to match(/Password/)
    end
  end
end

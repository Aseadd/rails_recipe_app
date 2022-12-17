require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'foods/index', type: :feature do
  include Devise::Test::IntegrationHelpers
  it 'visit foods index page' do
    user = User.create(name: 'ruth', email: 'ruth@gmail.com', password: '12345678')
    sign_in user
    visit foods_path
    expect(page).to have_content('Foods')
  end
end

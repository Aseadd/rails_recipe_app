require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) do
    User.create(
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
    )
  end

  let!(:food) do
    Food.new(
      name: 'Tomatoes',
      unit: 'piece',
      price: '1.1',
      quantity: 0,
      user:
    )
  end
  it 'valid with all correct atributes' do
    expect(food).to be_valid
  end

  it 'invalid if name nil' do
    food.name = nil
    expect(food).to_not be_valid
  end
  it 'invalid if unit nil' do
    food.unit = nil
    expect(food).to_not be_valid
  end
  it 'invalid if price nil' do
    food.price = nil
    expect(food).to_not be_valid
  end
  it 'invalid if quantity nil' do
    food.quantity = nil
    expect(food).to_not be_valid
  end
  it 'invalid if user nil' do
    food.user = nil
    expect(food).to_not be_valid
  end
end

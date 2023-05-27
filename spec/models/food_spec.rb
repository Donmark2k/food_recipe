require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    expect(Food.new(name: 'Anything', measurement_unit: 'kg', price: 250.0)).to be_valid
  end
  it 'is not valid without a name' do
    food = Food.new(name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without measurement_unit' do
    food = Food.new(measurement_unit: nil)
    expect(food).to_not be_valid
  end
  it 'is not valid without a price' do
    food = Food.new(price: nil)
    expect(food).to_not be_valid
  end
end

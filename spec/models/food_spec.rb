require 'rails_helper'

RSpec.describe Food, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'is valid with valid attributes' do
    expect(Food.new(name: 'Anything', calories: 100)).to be_valid
  end
  it 'is not valid without a name' do
    food = Food.new(name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without calories' do
    food = Food.new(calories: nil)
    expect(food).to_not be_valid
  end
  it 'is not valid with a name longer than 50 characters' do
    food = Food.new(name: 'a' * 51)
    expect(food).to_not be_valid
  end
end

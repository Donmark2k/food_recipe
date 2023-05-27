require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject do
    InventoryFood.new(
      quantity: 10,
      food_id: Food.first,
      inventory_id: Inventory.first
    )
  end
  before { subject.save }
  describe 'check Inventort invalidity' do
    it 'is invalid with no food_id' do
      expect(subject).to_not be_valid
    end
  end

  describe 'check inventory invalidity' do
    it 'is invalid with no quantity specified' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject do
    Inventory.new(
      name: 'Beans',
      user_id: User.first
    )
  end
  before { subject.save }
  describe 'check Inventort invalidity' do
    it 'is invalid with no user_id' do
      expect(subject).to_not be_valid
    end
  end

  describe 'check inventory invalidity' do
    it 'is invalid with no inventory name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
require 'rails_helper'

RSpec.describe "inventory_foods/index", type: :view do
  before(:each) do
    assign(:inventory_foods, [
      InventoryFood.create!(
        quantity: 2
      ),
      InventoryFood.create!(
        quantity: 2
      )
    ])
  end

  it "renders a list of inventory_foods" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

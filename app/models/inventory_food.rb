class InventoryFood < ApplicationRecord
  belongs_to :inventory, counter_cache: true
  belongs_to :food, counter_cache: true
  validates :quantity, numericality: { only_integer: true }
end

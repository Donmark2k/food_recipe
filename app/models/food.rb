class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods
  validates :measurement_unit, presence: true
  validates :price, numericality: { is_decimal: true }

  validates :name, presence: true
end

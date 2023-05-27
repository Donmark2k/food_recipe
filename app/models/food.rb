class Food < ApplicationRecord
  # belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :inventories, through: :inventory_foods

  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :measurement_unit, presence: true
  validates :price, numericality: { is_decimal: true }

  validates :name, presence: true
end

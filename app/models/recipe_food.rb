class RecipeFood < ApplicationRecord
  belongs_to :food, counter_cache: true
  belongs_to :recipe, counter_cache: true
  validates :quantity, numericality: { only_integer: true }
end

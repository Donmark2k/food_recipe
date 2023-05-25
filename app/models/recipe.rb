class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, numericality: { is_decimal: true }
  validates :description, presence: true
  validates :cooking_time, numericality: { is_decimal: true }
  validates :public, inclusion: { in: [true, false] }
end

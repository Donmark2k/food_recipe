class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, numericality: { is_decimal: true }
  validates :description, presence: true
  validates :cooking_time, numericality: { is_decimal: true }
  validates :public, inclusion: { in: [true, false] }

  def new_recipe_food(food, quantity)
    recipe_food = recipe_foods.build(food:, quantity:)
    recipe_food.save
  end

  def update_recipe_food(food, quantity)
    recipe_food = recipe_foods.find_by(food:)
    recipe_food.quantity += quantity.to_i
    recipe_food.save
  end

  def add_food_item(food: nil, quantity: 1)
    if recipe_foods.find_by(food:)
      update_recipe_food(food, quantity)
    else
      new_recipe_food(food, quantity)
    end
  end
end

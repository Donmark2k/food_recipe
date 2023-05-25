class Inventory < ApplicationRecord
  belongs_to :user

  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods
 
  validates :name, presence: true



   def new_inventory_food(food, quantity)
    inventory_food = inventory_foods.build(food: food, quantity: quantity)
    inventory_food.save
  end

  def add_inventory_food(food, quantity)
    inventory_food = inventory_foods.find_by(food: food)
    inventory_food.quantity += quantity.to_i
    inventory_food.save
  end

  def add_food_item(food:nil, quantity:1)
    if inventory_foods.find_by(food: food)
      add_inventory_food(food, quantity)
    else
      new_inventory_food(food, quantity)
    end
  end


  def remove_inventory_food(food:nil, quantity:0)
    inventory_food = inventory_foods.find_by(food: food)
    inventory_food.quantity -= quantity.to_i
    inventory_food.save
  end

end

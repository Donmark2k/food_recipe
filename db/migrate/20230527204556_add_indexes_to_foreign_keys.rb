class AddIndexesToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :inventories, :user_id
    add_index :inventory_foods, :food_id
    add_index :inventory_foods, :inventory_id
    add_index :recipe_foods, :food_id
    add_index :recipe_foods, :recipe_id
    add_index :recipes, :user_id
  end
end

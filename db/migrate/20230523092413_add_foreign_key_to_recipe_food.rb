class AddForeignKeyToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods , :user_id, :integer
    add_column :recipe_foods , :food_id, :integer

    add_foreign_key :recipe_foods, :users
    add_foreign_key :recipe_foods, :foods
  end
end

class AddForeignKeyToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :recipe_foods, :recipes
  end
end

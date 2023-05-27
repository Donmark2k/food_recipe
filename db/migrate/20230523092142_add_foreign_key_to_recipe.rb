class AddForeignKeyToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes , :user_id, :integer
    add_foreign_key :recipes, :users
  end
end

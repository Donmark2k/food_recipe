class AddForeignKeyToInventoryFood < ActiveRecord::Migration[7.0]
  def change
    add_column :inventory_foods , :inventory_id, :integer
    add_column :inventory_foods , :food_id, :integer

    add_foreign_key :inventory_foods, :inventories
    add_foreign_key :inventory_foods, :foods


  end
end

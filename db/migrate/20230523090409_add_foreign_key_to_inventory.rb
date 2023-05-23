class AddForeignKeyToInventory < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :inventories, :users

  end
end

class RemoveUserIdAndAddRecipeIdToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :user_id, :integer
    add_column :recipe_foods, :recipe_id, :integer
  end
end

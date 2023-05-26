class ShoppingListController < ApplicationController
  def show
    recipe_id = params[:recipe_id]
    @recipe = Recipe.find(recipe_id)
    @recipe_foods = RecipeFood.where(recipe_id:)

    inventory_id = params[:inventory_id]
    @inventory = Inventory.find(inventory_id)
    @inventory_foods = InventoryFood.where(inventory_id:)

    @shopping_list_foods = []

    @recipe_foods.each do |recipe_food|
      @inventory_foods.each do |inventory_food|
        # if food exist inbot reipe an inventory check quantity
        if recipe_food.food_id == inventory_food.food_id

          if inventory_food.quantity < recipe_food.quantity
            qunatity_needed = recipe_food.quantity - inventory_food.quantity
            recipe_food.quantity = qunatity_needed
            @shopping_list_foods.push(recipe_food)
          end
        else
          @shopping_list_foods.push(recipe_food)
        end
      end
    end
  end
end

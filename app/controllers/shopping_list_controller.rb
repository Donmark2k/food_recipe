class ShoppingListController < ApplicationController
  def show
    @recipe = Recipe.find(recipe_id: params[:recipe_id])
    @recipe_foods = RecipeFood.where(recipe_id:)

    @inventory = Inventory.find(inventory_id: params[:inventory_id])
    @inventory_foods = InventoryFood.where(inventory_id:)

    @shopping_list_foods = []

    @recipe_foods.each do |recipe_food|
      if @inventory_foods.find_by(food_id: recipe_food.food_id)
        inv_food = @inventory_foods.find_by(food_id: recipe_food.food_id)
        if inv_food.quantity < recipe_food.quantity
          qunatity_needed = recipe_food.quantity - inv_food.quantity
          recipe_food.quantity = qunatity_needed
          @shopping_list_foods.push(recipe_food)
        end
      else
        @shopping_list_foods.push(recipe_food)
      end
    end

    @total_value = @shopping_list_foods.sum do |food|
      food.food.price * food.quantity
    end
  end
end

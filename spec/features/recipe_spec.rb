require 'rails_helper'

RSpec.describe 'Recipe', type: :feature  do

	before(:all) do
		@user = FactoryBot.create(:user)
		@food = Food.create(name: 'Potato', price: 10.0, measurement_unit: 'kg')

		@recipe = Recipe.create(name: 'Recipe1', user: @user, preparation_time: 10, description: 'Recipe1',cooking_time:10, public: true)
		@recipe_food = @recipe.recipe_foods.build( food: @food, quantity: 10.0)
		@recipe_food.save
	end

	before(:each) do
		 
		 visit '/'

		 fill_in 'email', with: @user.email
		 fill_in 'password', with: @user.password
		
		 click_on 'Log in'
		
	end
	
	after(:all) do
		User.destroy_all
		Food.destroy_all
		Inventory.destroy_all
		InventoryFood.destroy_all
		Recipe.destroy_all
		RecipeFood.destroy_all
	end

	it 'shows the recipes' do
		
		visit '/recipes'

		expect(page).to have_content('Recipe1')
	end

	it 'shows the recipes contents' do
		
		visit '/recipes'

		click_on 'Recipe1'

		expect(page).to have_content('Add Ingredient')
	end
	it 'shows the recipes contents' do
		
		visit '/recipes'

		click_on 'Recipe1'

		expect(page).to have_content('Delete')
	end


end
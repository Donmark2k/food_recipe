require 'rails_helper'

RSpec.describe 'Inventory', type: :feature  do
	
	before(:all) do
		@user = FactoryBot.create(:user)
		@food = Food.create(name: 'Potato', price: 10.0, measurement_unit: 'kg')

		@inventory = Inventory.create(name: 'Inventory1', user: @user)

		@inventory_food = @inventory.inventory_foods.build( food: @food, quantity: 10)
		@inventory_food.save
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
	end


	it 'shows the inventories' do
		
		visit '/inventories'

		expect(page).to have_content('Inventory1')
	end

	it 'shows the inventories contents' do
		
		visit '/inventories'

		click_on 'Inventory1'

		expect(page).to have_content('Potato')
	end	
	it 'shows the inventories contents quantity' do
		
		visit '/inventories'

		click_on 'Inventory1'

		expect(page).to have_content('10')
	end


end	
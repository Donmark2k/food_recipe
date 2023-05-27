require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/inventory_foods', type: :request , mytest: :true  do
  # This should return the minimal set of attributes required to create a valid
  # InventoryFood. As you add validations to InventoryFood, be sure to
  # adjust the attributes here as well.
 
  before do
    @user = FactoryBot.create(:user)
    sign_in @user

    @food = Food.create(name: 'Potato', price: 10.0, measurement_unit: 'kg')

		@inventory = Inventory.create(name: 'Inventory1', user: @user)

  end

  after  do
    @user.destroy
  end

  let(:valid_attributes) do
    { inventory: @inventory, food: @food, quantity: 10}
  end

  let(:invalid_attributes) do
    { inventory: @inventory, food: nil, quantity: nil}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      InventoryFood.create! valid_attributes
      get inventory_foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      inventory_food = InventoryFood.create! valid_attributes
      get inventory_food_url(inventory_food)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_inventory_food_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      inventory_food = InventoryFood.create! valid_attributes
      get edit_inventory_food_url(inventory_food)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
  
      it 'redirects to the created inventory_food' do
        post inventory_foods_url, params: { inventory_food: valid_attributes }
      end
    end

    context 'with invalid parameters' do


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post inventory_foods_url, params: { inventory_food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
          { inventory: @inventory, food: @food, quantity: 20}
        
      end

      it 'updates the requested inventory_food' do
        inventory_food = InventoryFood.create! valid_attributes
        patch inventory_food_url(inventory_food), params: { inventory_food: new_attributes }
        inventory_food.reload

      end

      it 'redirects to the inventory_food' do
        inventory_food = InventoryFood.create! valid_attributes
        patch inventory_food_url(inventory_food), params: { inventory_food: new_attributes }
        inventory_food.reload
        expect(response).to redirect_to(inventory_food_url(inventory_food))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        inventory_food = InventoryFood.create! valid_attributes
        patch inventory_food_url(inventory_food), params: { inventory_food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested inventory_food' do
      inventory_food = InventoryFood.create! valid_attributes
      expect do
        delete inventory_food_url(inventory_food)
      end.to change(InventoryFood, :count).by(-1)
    end

    it 'redirects to the inventory_foods list' do
      inventory_food = InventoryFood.create! valid_attributes
      delete inventory_food_url(inventory_food)
      expect(response).to redirect_to(inventory_food_url(inventory_food))
    end
  end
end

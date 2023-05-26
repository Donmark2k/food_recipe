class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    @inventory_foods = @inventory.inventory_foods
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(user: current_user, name: inventory_params[:name])

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_inventory_foods
    # authorize! :test_method, @inventory
    puts '==================='
    puts 'test_method called'
    @foods = Food.order(created_at: :desc)
    render 'add_new_food'
  end

  def add_food_item
    # authorize! :add_food_item, @inventory
    puts '==================='
    puts 'add_food_item called'
    @inventory = Inventory.find(params[:id])
    quantity = params[:quantity]
    @food = Food.find(params[:food_id])

    @inventory.add_food_item(food: @food, quantity:)

    redirect_to request.referrer, notice: 'Food was successfully added to inventory.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name)
  end
end

class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  # rubocop:disable Metrics/MethodLength
  def create
    # food_params[:user] = current_user

    @food = Food.new(food_params)
    puts request.referer

    respond_to do |format|
      if @food.save
        if request.referer.include? 'inventories'
          inventory_id = params[:inventory_id] || extract_inventory_id
          format.html do
            redirect_to inventory_specific_food_path(inventory_id:, id: @food.id),
                        notice: 'Food was successfully created.'
          end

        elsif request.referer.include? 'recipes'
          recipe_id = params[:recipe_id] || extract_recipe_id
          format.html do
            redirect_to recipe_specific_food_path(recipe_id:, id: @food.id),
                        notice: 'Food was successfully created.'
          end

        else
          format.html { redirect_to food_url(@food), notice: 'Food was successfully created.' }
        end
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def extract_inventory_id
    referer_path = URI(request.referer).path
    Rails.application.routes.recognize_path(referer_path)[:inventory_id]
  end

  def extract_recipe_id
    referer_path = URI(request.referer).path
    Rails.application.routes.recognize_path(referer_path)[:recipe_id]
  end
end

class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  skip_before_action :verify_authenticity_token
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_foods = @recipe.recipe_foods
    @inventories = Inventory.all

    @inventory_names = @inventories.map(&:name)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_public
    # puts "%%%"*100
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)
    redirect_to recipe_url(@recipe)
  end

  def show_recipe_foods
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    render 'add_food_to_recipe'
  end

  def add_food_item
    puts 'add_food_item called'
    @recipe = Recipe.find(params[:id])
    quantity = params[:quantity]
    @food = Food.find(params[:food_id])

    @recipe.add_food_item(food: @food, quantity:)

    redirect_to request.referrer, notice: 'Food was successfully added to Recipe.'
  end

  def generate_shopping_list
    recipe_id =params[:recipe_id]
    inventory_name = params[:select_option]
    inventory_id = Inventory.find_by(name: inventory_name).id
    url_params = {
      recipe_id: recipe_id,
      inventory_id: inventory_id
    }

   redirect_to shopping_list_path(url_params)
  # redirect_to foods_path
  
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    
  end

  def url_params
    params.permit(:recipe_id, :inventory_id)
  end
end

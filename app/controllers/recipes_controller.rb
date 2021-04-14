class RecipesController < ApplicationController 
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @recipe.instructions.build
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :difficulty, :serving, :prep_time, instructions_attributes: [:id, :instruction_text], ingredients_attributes: [:id, :ingredient_list_id, :measurement_lookup_id, :amount])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end

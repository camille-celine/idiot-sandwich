class SavedRecipesController < ApplicationController
  before_action :set_saved_recipe, only: [:destroy]
  def index
    @user = current_user
    @saved_recipes = policy_scope(@user.saved_recipes)
    @my_recipes = policy_scope(@user.recipes)
    @recipes = policy_scope(@user.joint_recipes)
    @all_recipes = (@recipes + @my_recipes)
  end

  def create
    @saved_recipe = SavedRecipe.new
    @saved_recipe.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @saved_recipe.recipe = @recipe
    if @saved_recipe.save
      redirect_to saved_recipes_path
      # redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @saved_recipe
  end

  def destroy
    @saved_recipe.destroy
    redirect_to saved_recipes_path
  end

  private

  def set_saved_recipe
    @saved_recipe = SavedRecipe.find(params[:id])
    authorize @saved_recipe
  end
end

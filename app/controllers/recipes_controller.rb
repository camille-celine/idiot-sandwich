class RecipesController < ApplicationController 
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]

  def index
    @recipes = policy_scope(Recipe)
    @recipes = filter_recipes(Recipe)
  end

  def show
    @saved_recipe = SavedRecipe.new
  end

  def new
    @recipe = Recipe.new
    @recipe.instructions.build
    @recipe.ingredients.build
    @recipe.recipe_tags.build
    @categories = RecipeCategory.all
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
    authorize @recipe
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
    params.require(:recipe).permit(:name, :description, :cooking_time, :difficulty, :serving, :prep_time, instructions_attributes: [:id, :instruction_text], ingredients_attributes: [:id, :ingredient_list_id, :measurement_lookup_id, :amount], recipe_tags_attributes: [:id, :recipe_id, :tag_id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def filter_recipes(scope)
    # get request in URL
    if params[:query].present?
      @recipe_search = Recipe.search_name_and_description(params[:query])
      # i like insensitive
      # sql_query = "name ILIKE :query OR description ILIKE :query"
      # scope.where(sql_query, query: "%#{params[:query]}%")
    else
      scope.all
    end
  end
end

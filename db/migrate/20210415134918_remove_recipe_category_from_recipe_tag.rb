class RemoveRecipeCategoryFromRecipeTag < ActiveRecord::Migration[6.0]
  def change
    remove_reference :recipe_tags, :recipe_category, null: false, foreign_key: true
  end
end

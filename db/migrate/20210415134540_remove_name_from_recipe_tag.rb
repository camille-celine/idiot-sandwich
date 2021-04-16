class RemoveNameFromRecipeTag < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipe_tags, :name, :string
  end
end

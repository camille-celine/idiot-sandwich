class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :recipe_category
end

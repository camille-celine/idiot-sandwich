class RecipeCategory < ApplicationRecord
  has_many :recipe_tags
end

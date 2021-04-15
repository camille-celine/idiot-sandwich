class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :recipe_category

  validates :name, uniqueness: true
end

class RecipeCategory < ApplicationRecord
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags

  validates :name, uniqueness: true
end

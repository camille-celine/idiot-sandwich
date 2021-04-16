class RecipeCategory < ApplicationRecord
  has_many :tags
  has_many :recipes, through: :tags
end

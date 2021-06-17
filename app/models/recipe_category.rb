class RecipeCategory < ApplicationRecord
  has_many :tags
  has_many :recipes, through: :tags

  validates :name, uniqueness: true
end

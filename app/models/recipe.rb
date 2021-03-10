class Recipe < ApplicationRecord
  belongs_to :user
  has_many :intructions
  has_many :recipe_tags
  has_many :ingredients
  has_many :users, through: :saved_recipes
end

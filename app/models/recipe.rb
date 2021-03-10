class Recipe < ApplicationRecord
  belongs_to :user
  has_many :intructions, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :users, through: :saved_recipes
end

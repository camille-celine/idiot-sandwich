class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :users, through: :saved_recipes
  enum difficulty: { easy: 1, medium: 2, hard: 3}
end

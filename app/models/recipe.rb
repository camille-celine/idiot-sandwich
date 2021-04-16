class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :recipe_categories, through: :tags
  has_many :ingredients, dependent: :destroy
  has_many :ingredient_lists, through: :ingredients
  has_many :measurement_lookups, through: :ingredients
  has_many :users, through: :saved_recipes
  enum difficulty: { easy: 1, medium: 2, hard: 3}

  validates :name, :description, :cooking_time, :difficulty, :prep_time, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :instructions, :ingredients
end

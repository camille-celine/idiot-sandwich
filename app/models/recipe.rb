class Recipe < ApplicationRecord
  belongs_to :user
  has_many :instructions, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :recipe_categories, through: :tags
  has_many :ingredients, dependent: :destroy
  has_many :ingredient_lists, through: :ingredients
  has_many :measurement_lookups, through: :ingredients
  has_many :saved_recipes, dependent: :destroy
  has_many :users, through: :saved_recipes
  has_one_attached :photo
  enum difficulty: { easy: 1, medium: 2, hard: 3 }

  validates :name, :description, :cooking_time, :difficulty, :prep_time, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :instructions, :ingredients, :recipe_tags

  include PgSearch::Model
  pg_search_scope :search_name_and_description,
                  against: %i[name description],
                  associated_against: {
                    ingredient_lists: :name
                  },
                  using: {
                    # full text search, supports weightung, prefix searches, and stemming in multiple languages
                    tsearch: { prefix: true }
                  }

  
end

class IngredientList < ApplicationRecord
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates :name, presence: true
  validates :name, uniqueness: true
end

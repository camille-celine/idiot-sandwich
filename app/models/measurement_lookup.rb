class MeasurementLookup < ApplicationRecord
  has_many :ingredients
  has many :recipes, through: :ingredients
end

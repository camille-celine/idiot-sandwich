class Ingredient < ApplicationRecord
  belongs_to :ingredient_list
  belongs_to :recipe
  belongs_to :measurement_lookup
end

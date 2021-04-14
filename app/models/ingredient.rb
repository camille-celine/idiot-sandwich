class Ingredient < ApplicationRecord
  belongs_to :ingredient_list
  belongs_to :recipe
  belongs_to :measurement_lookup

  # include PgSearch::Model
  # pg_search_scope :search,
  #                 against: %i[name],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
end

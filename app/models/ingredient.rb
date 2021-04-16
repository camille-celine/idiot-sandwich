class Ingredient < ApplicationRecord
  belongs_to :ingredient_list
  belongs_to :recipe
  belongs_to :measurement_lookup

  validates :amount, presence: true
  validates :measurement_lookup_id, :ingredient_list_id, presence: { message: "must be given"}

  # include PgSearch::Model
  # pg_search_scope :search,
  #                 against: %i[name],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
end

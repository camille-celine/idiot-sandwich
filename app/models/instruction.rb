class Instruction < ApplicationRecord
  belongs_to :recipe

  validates :instruction_text, presence: true
end

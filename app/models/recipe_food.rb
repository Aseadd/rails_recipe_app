class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :amount, presence: true, numericality: { greater_than: 0 }
end

class Food < ApplicationRecord
  belongs_to :user
  has_many :RecipeFood, dependent: :destroy
  has_many :recipes, through: :RecipeFood

  validates :name, presence: true
  validates :unit, presence: true, inclusion: { in: %w[gram kilogram liter milliliter piece] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food, through: :RecipeFood
end

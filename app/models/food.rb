class Food < ApplicationRecord
  belongs_to :user
  has_many :RecipeFood
  has_many :recipes, through: :RecipeFood
end

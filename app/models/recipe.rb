class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipeFood
  has_many :ingredients, through: :RecipeFood, source: :food

  def self.publics
    where(public: true)
  end
end

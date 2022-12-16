class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipeFood
  has_many :ingredients, through: :recipeFood, source: :food

  validates :name, presence: true
  validates :preparation_time_seconds, presence: true, numericality: { greater_than: 0 }
  validates :cooking_time_seconds, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def not_used_ingredients
    user.foods - ingredients
  end

  def self.publics
    where(public: true)
  end
end

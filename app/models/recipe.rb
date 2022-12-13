class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food, through: :RecipeFood

  def self.publics
    where(public: true).includes(:food)
  end
end

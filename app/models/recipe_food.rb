class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  def need_to_buy
    return 0 if amount <= food.quantity

    amount - food.quantity
  end

  def cost_of_need_to_buy
    need_to_buy * food.price
  end

  def total_cost
    amount * food.price
  end

  validates :amount, presence: true, numericality: { greater_than: 0 }
end

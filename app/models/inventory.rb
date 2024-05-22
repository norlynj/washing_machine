class Inventory < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }



end

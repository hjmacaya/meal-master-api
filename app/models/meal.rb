class Meal < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :protein_portions, :cereals_portions, :vegetables_portions, :fruit_portions, :fat_portions, :dairy_portions, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

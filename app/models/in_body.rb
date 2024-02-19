class InBody < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :nutritionist

  # Validations
  validates :user_id, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 120 }
  validates :height, presence: true, numericality: { greater_than: 0, less_than: 3 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :genre, presence: true
  validates :date, presence: true
  validates :body_water, presence: true, numericality: { greater_than: 0 }
  validates :protein_mass, :minerals_mass, :body_fat, :lean_mass, :mass_free_of_fat, :muscle_mass, presence: true, numericality: { greater_than: 0 }, less_than_attribute: { compare_to: :weight }
end

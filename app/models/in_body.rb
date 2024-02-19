class InBody < ApplicationRecord
  # Callbacks
  before_save :calculate_indicators

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

  private

  # Method to set the indicators of the in_body
  def calculate_indicators
    self.imc = (weight / (height * height)).round(2)
    self.percentage_body_fat = (body_fat / weight * 100).round(2)
    self.aec = (weight - mass_free_of_fat).round(2)
  end
end

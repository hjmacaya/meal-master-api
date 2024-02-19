class Guideline < ApplicationRecord
  # Associations
  belongs_to :nutritionist
  belongs_to :user
end

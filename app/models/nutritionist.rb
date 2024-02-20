class Nutritionist < ApplicationRecord
  # Include JTI revocation strategy
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Devise config
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Relationships/References
  has_many :in_bodies, dependent: :destroy
end

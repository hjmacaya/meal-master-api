class User < ApplicationRecord
  # Include revocation strategy for JWT
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Devise config
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Relationships/References
  has_many :in_bodies, dependent: :destroy
end

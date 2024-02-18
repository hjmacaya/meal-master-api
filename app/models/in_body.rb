class InBody < ApplicationRecord
  belongs_to :user
  belongs_to :nutritionist
end

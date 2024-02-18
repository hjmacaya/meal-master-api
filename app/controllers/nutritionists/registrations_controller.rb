# frozen_string_literal: true

class Nutritionists::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_nutritionist, _opts = {})
    if resource.persisted?
      render json: {
        status: {
          code: 200,
          message: 'Signed up successfully.'
        },
        data: NutritionistSerializer.new(current_nutritionist).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {
          message: "Something went wrong. #{current_nutritionist.errors.full_messages.to_sentence}"
        }
      }, status: :unprocessable_entity
    end
  end
end

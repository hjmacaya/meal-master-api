class Nutritionists::InBodiesController < ApplicationController
  before_action :authenticate_nutritionist!

  def index
    @in_bodies = current_nutritionist.in_bodies
    render json: {
      status: {
        code: 200,
        message: 'Successfully fetched nutrionists in_bodies.'
      },
      data: @in_bodies
    }
  end

  def create
    @in_body = InBody.new(in_body_params)
    @in_body.nutritionist = current_nutritionist
    if @in_body.save
      render json: {
        status: {
          code: 200,
          message: 'Successfully created in_body.'
        },
        data: @in_body
      }
    else
      render json: {
        status: {
          code: 422,
          message: 'In_body could not be created.'
        },
        errors: @in_body.errors
      }
    end
  end

  private

  def in_body_params
    params.require(:in_body).permit(:weight, :height, :age, :genre, :date, :body_water, :protein_mass, :minerals_mass, :body_fat, :muscle_mass, :imc, :percentage_body_fat, :right_arm, :left_arm, :right_leg, :left_leg, :aec, :user_id)
  end
end

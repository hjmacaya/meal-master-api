class Nutritionists::InBodiesController < ApplicationController
  before_action :authenticate_nutritionist!
  before_action :set_in_body, only: %i[update destroy]

  def index
    @in_bodies = current_nutritionist.in_bodies
    render json: @in_bodies, status: :ok
  end

  def create
    @in_body = InBody.new(in_body_params)
    @in_body.nutritionist = current_nutritionist
    if @in_body.save
      render json: @in_body, status: :created
    else
      render json: @in_body.errors, status: :unprocessable_entity
    end
  end

  def update
    if @in_body.update(in_body_params)
      render json: @in_body, status: :ok
    else
      render json: @in_body.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @in_body.destroy
    head :no_content
  end

  private

  def in_body_params
    params.require(:in_body).permit(:weight, :height, :age, :genre, :date, :body_water, :protein_mass, :minerals_mass, :body_fat, :muscle_mass, :lean_mass, :mass_free_of_fat, :right_arm, :left_arm, :right_leg, :left_leg, :user_id)
  end

  def set_in_body
    @in_body = InBody.find(params[:id])
  end
end

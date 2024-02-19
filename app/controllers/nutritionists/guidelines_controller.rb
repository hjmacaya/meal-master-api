class Nutritionists::GuidelinesController < ApplicationController
  before_action :authenticate_nutritionist!
  before_action :set_guideline, only: %i[show update destroy]

  def index
    @guidelines = current_nutritionist.guidelines
    render json: @guidelines, status: :ok
  end

  def create
    @guideline = Guideline.new(guideline_params)
    @guideline.nutritionist = current_nutritionist
    if @guideline.save
      render json: @guideline, status: :created
    else
      render json: @guideline.errors, status: :unprocessable_entity
    end
  end

  def update
    if @guideline.update(guideline_params)
      render json: @guideline, status: :ok
    else
      render json: @guideline.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @guideline, status: :ok
  end

  def destroy
    @guideline.destroy
    head :no_content
  end

  private

  def guideline_params
    params.require(:guideline).permit(:user_id, :calories_requirement_per_day)
  end

  def set_guideline
    @guideline = Guideline.find(params[:id])
  end
end

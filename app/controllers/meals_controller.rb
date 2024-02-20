class MealsController < ApplicationController
  before_action :set_meal, only: %i[update destroy show]
  before_action :authenticate_user_or_nutritionist!

  def index
    @meals = Meal.all
    render json: @meals, status: :ok
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      render json: @meal, status: :created
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      render json: @meal, status: :ok
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @meal, status: :ok
  end

  def destroy
    @meal.destroy
    head :no_content
  end

  private

  def meal_params
    params.permit(:name, :protein_portions, :cereals_portions, :vegetables_portions, :fruit_portions, :fat_portions, :dairy_portions)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end
end

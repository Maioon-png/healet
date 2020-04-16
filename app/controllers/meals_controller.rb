class MealsController < ApplicationController
  def index
    @meals = Meal.where(user_id: current_user.id).order(recorded_date: "DESC")
  end

  def new
    @meal = Meal.new
  end

  def create
    Meal.create(meal_params)
    redirect_to meals_path
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    meal = Meal.find(params[:id])
    meal.update(meal_params)
    redirect_to meals_path
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy
    redirect_to meals_path
  end

  private
  def meal_params
    params.require(:meal).permit(:recorded_date, :morning, :lunch, :dinner, :other).merge(user_id: current_user.id)
  end

end

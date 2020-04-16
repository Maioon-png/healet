class WeightsController < ApplicationController

  def index
    @user_datas = Weight.where(user_id: current_user.id).order(recorded_date: "ASC")
    @weights = @user_datas.pluck(:weight)
    @day_and_time = @user_datas.pluck(:recorded_date)
    @dates = @day_and_time.map{|a| a.strftime('%Y/%m/%d')}
  end

  def new
    @weight = Weight.new
  end

  def create
    Weight.create(weight_params)
    redirect_to weights_path
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    weight = Weight.find(params[:id])
    weight.update(weight_params)
    redirect_to weights_path
  end

  def destroy
    weight = Weight.find(params[:id])
    weight.destroy
    redirect_to weights_path
  end

  private
  def weight_params
    params.require(:weight).permit(:recorded_date, :weight).merge(user_id: current_user.id)
  end

end

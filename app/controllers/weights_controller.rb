class WeightsController < ApplicationController
  before_action :move_to_index
  before_action :set_params, only: [:edit, :update, :destroy]
  
  def index
    @user = User.find(current_user.id)
    @user_datas = Weight.where(user_id: current_user.id).order(recorded_date: "ASC")
    @weights = @user_datas.pluck(:weight)
    @day_and_time = @user_datas.pluck(:recorded_date)
    @dates = @day_and_time.map{|a| a.strftime('%Y/%m/%d')}
  end

  def new
    @weight = Weight.new
  end

  def create
    weight = Weight.new(weight_params)
    if weight.save
      redirect_to weights_path
    else
      flash.now[:alert] = 'エラーが発生しました。'
      render :new
    end
  end

  def edit
  end

  def update
    @weight.update(weight_params)
    redirect_to weights_path
  end

  def destroy
    @weight.destroy
    redirect_to weights_path
  end

  private
  def weight_params
    params.require(:weight).permit(:recorded_date, :weight).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "Please Sign up or log in."
      redirect_to root_path
    end
  end

  def set_params
    @weight = Weight.find(params[:id])
  end

end

class UsersController < ApplicationController
  before_action :move_to_index

  def index
    @user = User.find(current_user.id)
    @weights = Weight.where(user_id: current_user.id).order(recorded_date: "ASC")
    @latest_waight = @weights.last
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    # redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :name, :target_weight).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "サインアップ / ログインをお願いします。"
      redirect_to controller: :top, action: :index
    end
  end

end

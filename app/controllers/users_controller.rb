class UsersController < ApplicationController
  before_action :move_to_index

  def index
    @user = User.find(current_user.id)
    @weights = Weight.where(user_id: current_user.id).order(recorded_date: "ASC")
    @latest_waight = @weights.last
  end

  private

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "Please log in."
      redirect_to controller: :top, action: :index
    end
  end

end

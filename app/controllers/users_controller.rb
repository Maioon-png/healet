class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @weights = Weight.where(user_id: current_user.id).order(recorded_date: "ASC")
    @latest_waight = @weights.last
  end
end

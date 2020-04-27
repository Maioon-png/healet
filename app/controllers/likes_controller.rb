class LikesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @topic.do_like(current_user)
  end

  def destroy
    @topic = Like.find(params[:id]).topic
    @topic.delete_like(current_user)
  end
end

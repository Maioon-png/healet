class LikesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id]) 
    unless @topic.already_liked?(current_user)
      @topic.do_like(current_user)
      respond_to do |format|
        format.html { redirect_to topic_path(@topic) }
        format.js
      end
    end
  end

  def destroy
    @topic = Like.find(params[:id]).topic
    if @topic.already_liked?(current_user)
      @topic.delete_like(current_user)
      respond_to do |format|
        format.html { redirect_to topic_path(topic_id: params[:topic_id]) }
        format.js
      end
    end    
  end
end

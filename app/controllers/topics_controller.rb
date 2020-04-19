class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    tag_list = params[:tags].split(",")
    if @topic.save
      @topic.save_tags(tag_list)
      redirect_to topics_path
    else
      render 'topics/new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
    @comments = @topic.comments.includes(:user)
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content).merge(user_id: current_user.id)
  end

end

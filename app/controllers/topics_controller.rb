class TopicsController < ApplicationController
  before_action :move_to_index

  def index
    @topics = Topic.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @topic = Topic.new
    @all_tag_list = Tag.all.pluck(:name)
  end

  def create
    @topic = Topic.create(topic_params)
    tag_list = params[:tags].join(",")
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

  def edit
    @topic = Topic.find(params[:id])
    @tag_list = @topic.tags.pluck(:name).join(",")
    @all_tag_list = Tag.all.pluck(:name)
  end

  def update
    @topic = Topic.find(params[:id])
    tag_list = params[:tags].split(",")
    if @topic.update(topic_params)
      @topic.save_tags(tag_list)
    end
    redirect_to topics_path
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "Please sign up or log in."
      redirect_to controller: :top, action: :index
    end
  end

end

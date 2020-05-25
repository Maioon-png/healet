class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    if params[:tag_id]
      @selected_tag = Tag.find(params[:tag_id])
      @topics = Topic.from_tag(params[:tag_id]).page(params[:page])
    else
      @topics= Topic.all.page(params[:page])
    end
  end
end

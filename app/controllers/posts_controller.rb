class PostsController < ApplicationController
  def index
    @feed = Feed.find(params[:feed_id])
  end
end

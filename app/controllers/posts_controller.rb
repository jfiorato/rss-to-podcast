class PostsController < ApplicationController
  def index
    @feed = current_user.feeds.find(params[:feed_id])
  end
end

class PostsController < ApplicationController

  skip_before_action :set_user!, only: [:rss]

  def index
    @feed = current_user.feeds.find(params[:feed_id])
  end

  def podcast
    @feed = Feed.find(params[:feed_id])

    render layout: false, content_type: "application/rss+xml"
  end
end

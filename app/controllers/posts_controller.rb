class PostsController < ApplicationController
  def index
    @feed = current_user.feeds.find(params[:feed_id])

    respond_to do |format|
      format.html { render }
      format.rss  { render layout: false, content_type: "application/rss+xml" }
    end
  end
end

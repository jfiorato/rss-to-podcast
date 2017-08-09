class FeedsController < ApplicationController
  def index
    @feeds = current_user.feeds
  end

  def new
    @feed = current_user.feeds.new
  end

  def create
    @feed = current_user.feeds.new(secure_params)

    if @feed.save
      redirect_to feeds_path, notice: 'Feed successfully created.'
    else
      render :new
    end
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    redirect_to feeds_path, notice: 'Feed successfully deleted.'
  end

private

  def secure_params
    params.require(:feed).permit(:url)
  end
end

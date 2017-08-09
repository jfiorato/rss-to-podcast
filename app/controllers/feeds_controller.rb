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
    @feed = current_user.feeds.find(params[:id])
  end

  def destroy
    @feed = current_user.feeds.find(params[:id])
    @feed.destroy

    redirect_to feeds_path, notice: 'Feed successfully deleted.'
  end

  def fetch
    feed = current_user.feeds.find(params[:id])
    FetchFeedJob.perform_later feed.id

    redirect_to feeds_path, notice: 'Feed is scheduled to be fetched.'
  end

private

  def secure_params
    params.require(:feed).permit(:url)
  end
end

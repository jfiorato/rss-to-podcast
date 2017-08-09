class FetchFeedJob < ActiveJob::Base
  queue_as :default

  def perform(feed_id)
    feed = Feed.find(feed_id)

    parsed_feed = Feedjira::Feed.fetch_and_parse(feed.url)

    parsed_feed.entries.each do |entry|
      create_post(feed, entry)
    end
  end

  def create_post(feed, entry)
    return if feed.posts.where(entry_id: entry.entry_id.to_s.strip).exists?

    feed.posts.create({
      entry_id: entry.entry_id.to_s.strip,
      title: entry.title.strip,
      content: process_content(entry)
    })
  end

  def process_content(entry)
    content = entry.content.strip.blank? ? entry.summary : entry.content
    Nokogiri::HTML(content).text
  end
end

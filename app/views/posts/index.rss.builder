xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", :"xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd" do
  xml.channel do
    xml.title "Synthesized Audio Podcast for #{@feed.url}"
    xml.description "Synthesized Audio Podcast for #{@feed.url}"
    xml.link @feed.url

    @feed.posts.by_date_desc.with_audio.limit(20).each do |post|
      xml.item do
        xml.itunes :author, "RSS to Podcast App"
        xml.guid post.audio_url, is_permalink: true
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.enclosure(
          url: post.audio_url,
          type: 'audio/mpeg'
        )
      end
    end
  end
end

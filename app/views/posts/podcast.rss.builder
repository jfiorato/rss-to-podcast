xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0',
  :"xmlns:itunes" => 'http://www.itunes.com/dtds/podcast-1.0.dtd',
  :"xmlns:atom" => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title "Synthesized Audio Podcast for #{@feed.url}"
    xml.description "Synthesized Audio Podcast for #{@feed.url}"
    xml.link @feed.url
    xml.language 'en-us'
    xml.atom :link, rel: 'self', type: 'application/rss+xml', href: request.original_url
    xml.itunes :category, text: 'News & Politics'
    xml.itunes :explicit, 'No'

    @feed.posts.by_date_desc.with_audio.limit(20).each do |post|
      xml.item do
        xml.title post.title
        xml.itunes :author, 'RSS to Podcast App'
        xml.guid post.audio_url, isPermaLink: true
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.enclosure(
          url: post.audio_url,
          type: 'audio/mpeg',
          length: post.audio_file_size
        )
      end
    end
  end
end

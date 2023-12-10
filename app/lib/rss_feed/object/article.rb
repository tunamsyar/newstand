module RssFeed::Object
  class Article
    attr_reader :rss_item

    def initialize(rss_item)
      @rss_item = rss_item
    end

    def to_params
      {
        title: title,
        author: author,
        published_at: published_at,
        original_url: url,
        original_image_url: image_url
      }
    end

    def url
      rss_item.xpath('link').text
    end

    def title
      rss_item.xpath('title').text
    end

    def author
      rss_item.xpath('dc:creator').text
    end

    def published_at
      rss_item.xpath('pubDate').text
    end

    def image_url
      extracted_url = if rss_item.xpath('media:content', namespaces).attr('url').present?
        rss_item.xpath('media:content', namespaces).attr('url')&.text
      elsif rss_item.xpath('content:encoded').present?
        rss_item.xpath('content:encoded').last.text.match(/src=\"(.*?)\"/)&.captures&.first
      end

      extracted_url || 'https://placehold.co/600x400.png'
    end

    private

    def namespaces
      @_namespaces ||= { 'media' => 'http://search.yahoo.com/mrss/' }
    end
  end
end

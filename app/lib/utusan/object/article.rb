module Utusan::Object
  class Article
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
      @rss_item.link
    end

    def title
      @rss_item.title
    end

    def author
      @rss_item.dc_creator || "Utusan Malaysia"
    end

    def published_at
      @rss_item.pubDate
    end

    def content
      @rss_item.content_encoded
    end

    def image_url
      @rss_item.description.match(/src=\"(.*?)\"/)&.captures&.first || 'https://placehold.co/600x400.png'
    end
  end
end

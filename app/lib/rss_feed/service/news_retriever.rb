module RssFeed::Service
  class NewsRetriever
    def self.call(url)
      new(url).call
    end

    def initialize(url)
      @url = url
    end

    def call
      rss_feed = Rss.new(@url).get_feed

      RssFeed::Converter.convert_to_params(rss_feed)
    rescue => e
      RaiseError.call(e)
    end
  end
end

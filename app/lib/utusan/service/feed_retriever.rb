module Utusan::Service
  class FeedRetriever
    # Retrieves and converts RSS feed items from a given URL.
    #
    # @param url [String] The URL of the RSS feed.
    # @return [Array] An array of converted feed items.
    def self.call(url)
      new(url).call
    end

    # Initializes a new instance of FeedRetriever.
    #
    # @param url [String] The URL of the RSS feed.
    def initialize(url)
      @url = url
    end

    # Retrieves and converts the RSS feed items.
    #
    # @return [Array] An array of converted feed items.
    def call
      rss_feed = Rss.new(@url).get_feed
      Utusan::Converter.convert_from_rss_to_object(rss_feed)
    end
  end
end

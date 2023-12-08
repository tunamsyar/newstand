require 'rss'
require 'open-uri'

class Rss
  def initialize(url)
    @url = url
  end

  def get_feed
    feed = RSS::Parser.parse(URI.open(@url), false).items

    return feed if feed.present?

    []
  end
end

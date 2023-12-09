module Feeds
  class PullFromRssJob < ApplicationJob

    queue_as :default

    def perform
      FeedMethod.rss.find_each do |feed_method|
        # ServiceToCallRss.new(feed_method).call
      end
    end
  end
end

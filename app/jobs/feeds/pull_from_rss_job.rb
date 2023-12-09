module Feeds
  class PullFromRssJob < ApplicationJob

    queue_as :default

    def perform
      FeedMethod.rss.find_each do |feed_method|
        Feeds::PullFromSources.call(feed_method)
      end
    end
  end
end

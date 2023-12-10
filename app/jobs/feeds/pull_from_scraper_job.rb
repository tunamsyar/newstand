module Feeds
  class PullFromScraperJob < ApplicationJob
    sidekiq_options retry: 0
    queue_as :default

    def perform
      FeedMethod.scrape.find_each do |feed_method|
        # ServiceToScrape.new(feed_method).call
      end
    end
  end
end

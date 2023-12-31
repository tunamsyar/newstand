module Feeds
  class PullFromApiJob < ApplicationJob
    sidekiq_options retry: 0
    queue_as :default

    def perform
      FeedMethod.api.find_each do |feed_method|
        Feeds::PullFromSources.call(feed_method)
      end
    end
  end
end

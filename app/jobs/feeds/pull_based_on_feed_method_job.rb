module Feeds
  class PullBasedOnFeedMethodJob < ApplicationJob
    sidekiq_options retry: 0
    queue_as :default

    def perform(feed_method)
      Feeds::PullFromSources.call(feed_method)
    end
  end
end

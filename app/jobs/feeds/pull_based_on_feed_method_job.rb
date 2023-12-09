module Feeds
  class PullBasedOnFeedMethodJob < ApplicationJob

    queue_as :default

    def perform(feed_method)
      Feeds::PullFromSources.call(feed_method)
    end
  end
end

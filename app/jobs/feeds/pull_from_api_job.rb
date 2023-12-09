module Feeds
  class PullFromApiJob < ApplicationJob

    queue_as :default

    def perform
      FeedMethod.api.find_each do |feed_method|
        # ServiceToCallApi.new(feed_method).call
      end
    end
  end
end

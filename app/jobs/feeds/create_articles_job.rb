module Feeds
  class CreateArticlesJob < ApplicationJob
    queue_as :articles

    def perform(article_objects:, publisher:)
      Articles::Creator.call(article_objects: article_objects, publisher: publisher)
    end
  end
end

module Feeds
  class PullFromApi
    def self.call(feed_method)
      new(feed_method).call
    end

    def initialize(feed_method)
      @feed_method = feed_method
    end

    def call
      article_objects = retriever_class_name.constantize.call(url)

      ::Feeds::CreateArticlesJob.perform_later(
        article_objects: article_objects,
        publisher: publisher
      )
    rescue StandardError => e
      # alert error
    end

    private

    attr_reader :feed_method

    def publisher
      @_publisher ||= feed_method.publisher
    end

    def url
      @_url ||= feed_method.source_url
    end

    def publisher_name
      @_publisher_name ||= publisher.name
    end

    def library_name
      @_library_name ||= publisher_name.split.map(&:capitalize).join
    end

    def retriever_class_name
      @_retriever_class_name ||= "#{library_name}::Service::NewsRetriever"
    end
  end
end

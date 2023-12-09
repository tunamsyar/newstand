module Utusan
  class Converter
    def self.convert_to_object(rss_feed_items)
      rss_feed_items.map do |item|
        Utusan::Object::Article.new(item)
      end
    end

    def self.convert_to_params(rss_feed_items)
      rss_feed_items.map do |item|
        Utusan::Object::Article.new(item).to_params
      end
    end
  end
end

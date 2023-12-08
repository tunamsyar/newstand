module Utusan
  class Converter
    def self.convert_from_rss_to_object(rss_feed_items)
      rss_feed_items.map do |item|
        Utusan::Object::Article.new(item)
      end
    end
  end
end

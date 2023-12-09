module Articles
  class Creator
    def self.call(article_objects:, publisher:)
      new(article_objects, publisher).call
    end

    def initialize(article_objects, publisher)
      @article_objects = article_objects
      @publisher = publisher
    end

    def call
      ActiveRecord::Base.transaction do
        article_objects.each do |article|
          publisher.articles.find_or_create_by!(article)
        rescue ActiveRecord::Invalid => e
          # log e
        end
      end

    end

    private

    attr_reader :article_objects, :publisher
  end
end

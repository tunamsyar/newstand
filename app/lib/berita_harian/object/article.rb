module BeritaHarian::Object
  class Article
    def initialize(json)
      @json = json
    end

    def to_params
      {
        title: title,
        original_url: url,
        author: author,
        published_at: Time.at(created)
      }
    end

    def keys
      [
        "nid",
        "title",
        "created",
        "changed",
        "sponsored",
        "premium",
        "url",
        "internal_url",
        "emotion",
        "segment",
        "sentiment",
        "field_hide_related_articles",
        "field_force_ads",
        "field_article_author",
        "field_author_email",
        "field_article_authors",
        "field_byline_prefix",
        "field_article_topic",
        "field_tags",
        "field_article_images",
        "field_article_images_filtered",
        "field_article_videos",
        "field_image_listing_featured_v2",
        "field_image_listing_v2",
        "field_image_portrait",
        "field_image_socialmedia",
        "field_image_first_sb_featured",
        "field_image_second_sb_featured",
        "field_image_listing_featured",
        "field_image_listing_th",
        "field_image_three_wide_col",
        "field_image_two_wide_col",
        "field_image_mobile_th",
        "field_article_lead",
        "body",
        "body_with_inline",
        "word_count"
      ]
    end

    def nid
      @json["nid"]
    end

    def title
      @json["title"]
    end

    def created
      @json["created"]
    end

    def author
      if field_article_author
        @json["field_article_author"]["name"]
      else
        "Berita Harian"
      end
    end

    def field_article_author
      @json["field_article_author"]
    end

    def url
      @json["url"]
    end

    def body
      @json["body"]
    end

    def body_with_inline
      @json["body_with_inline"]
    end

  end
end


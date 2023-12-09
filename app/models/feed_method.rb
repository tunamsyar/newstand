class FeedMethod < ApplicationRecord
  belongs_to :publisher

  validates :source_url, presence: true

  enum pull_method: { "rss": 0, "api": 1, "scrape": 2 }

  def self.pull_method_options
    pull_methods.map { |k, _v| [k.titleize, k] }
  end
end

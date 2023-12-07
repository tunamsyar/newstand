class Publisher < ApplicationRecord
  validates :name, presence: true
  validates :rss_url, presence: true

  enum language: { "english": 0, "malay": 1 }

  def self.language_options
    languages.map { |k, _v| [k.titleize, k] }
  end
end

class Publisher < ApplicationRecord
  validates :name, presence: true

  enum language: { "english": 0, "malay": 1 }

  has_many :articles
  has_many :feed_methods

  accepts_nested_attributes_for :feed_methods, allow_destroy: true

  def self.language_options
    languages.map { |k, _v| [k.titleize, k] }
  end
end

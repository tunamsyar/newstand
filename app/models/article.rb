class Article < ApplicationRecord
  validates :title, presence: true
  validates :original_url, presence: true
  validates :author, presence: true
  validates :published_at, presence: true

  belongs_to :publisher

  has_one_attached :image

  def self.ransackable_associations(auth_object = nil)
    ["publisher"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["publisher_language_eq"]
  end


  def image_url
    return original_image_url if original_image_url.present?

    if image.attached?
      image.url
    else
      'https://placehold.co/600x400.png'
    end
  end
end

class AddImageUrlToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :original_image_url, :string
  end
end

class RemoveRssUrlFromPublisher < ActiveRecord::Migration[7.0]
  def change
    remove_column :publishers, :rss_url, :string
  end
end

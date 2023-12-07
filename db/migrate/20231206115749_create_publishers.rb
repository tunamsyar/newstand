class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name, null: false
      t.integer :language, default: 0, null: false
      t.string :rss_url, null: false
      t.timestamps
    end
  end
end

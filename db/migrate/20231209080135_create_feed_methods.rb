class CreateFeedMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_methods do |t|
      t.references :publisher, null: false
      t.string :source_url, null: false
      t.integer :pull_method, default: 0, null: false
      t.timestamps
    end
  end
end

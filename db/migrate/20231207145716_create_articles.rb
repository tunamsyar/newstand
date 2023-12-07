class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :original_url, null: false
      t.string :author, null: false
      t.references :publisher, null: false, index: true
      t.datetime :published_at, null: false
      t.timestamps
    end
  end
end

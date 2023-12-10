class CreateErrorRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :error_records do |t|
      t.string :function_name
      t.string :message
      t.references :errorable, polymorphic: true
      t.boolean :is_resolved, default: false, null: false
      t.datetime :resolved_at
      t.timestamps
    end
  end
end

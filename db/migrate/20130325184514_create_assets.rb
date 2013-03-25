class CreateAssets < ActiveRecord::Migration
  def up
    create_table :assets do |t|
      t.integer :event_id
      t.string :filename
      t.string :description
      t.string :file_text
      t.timestamps
    end
  end
  def down
    drop_table :assets
  end
end

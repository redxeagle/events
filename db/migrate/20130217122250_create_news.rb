class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.integer :user_id
      t.string :headline
      t.string :subline
      t.string :news_text
      t.timestamps
    end
  end
  def down
    drop_table :news
  end
end

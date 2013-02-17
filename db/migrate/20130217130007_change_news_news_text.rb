class ChangeNewsNewsText < ActiveRecord::Migration
  def up
    change_column :news, :news_text, :text
  end

  def down
    change_column :news, :news_text, :string
  end
end

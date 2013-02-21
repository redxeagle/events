class EventDescriptionFix < ActiveRecord::Migration
  def up
    remove_column :events, :description
    add_column :events, :description, :text
  end

  def down
      remove_column :events, :description
      add_column :events, :description, :string
  end
end

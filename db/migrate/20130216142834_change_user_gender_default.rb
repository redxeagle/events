class ChangeUserGenderDefault < ActiveRecord::Migration
  def up
    change_column :users, :male, :boolean, :default => false
  end

  def down
    change_column :users, :male
  end
end

class AddHalls < ActiveRecord::Migration
  def up
    create_table :halls do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def down
    drop_table :halls
  end
end

class AddParticipants < ActiveRecord::Migration
  def up
    create_table :participants do |t|
      t.integer :user_id
      t.boolean :payed
      t.integer :event_id
      t.boolean :power
      t.integer :rank
      t.integer :points
      t.timestamps
    end
  end

  def down
    drop_table :participants
  end
end

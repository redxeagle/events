class AddEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.integer :hall_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :registration
      t.date :registration_start
      t.date :registration_end
      t.integer :maximum_participant
      t.string :description
      t.string :calculation_type
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end

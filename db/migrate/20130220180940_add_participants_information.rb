class AddParticipantsInformation < ActiveRecord::Migration
  def up
    add_column :participants, :second_name, :string
    add_column :participants, :first_name, :string
    add_column :participants, :city, :string
    add_column :participants, :birthday, :date
    add_column :participants, :male, :boolean
    add_column :participants, :self_registration, :boolean
  end

  def down
    remove_column :participants, :second_name
    remove_column :participants, :first_name
    remove_column :participants, :city
    remove_column :participants, :birthday
    remove_column :participants, :male
    remove_column :participants, :self_registration
  end
end

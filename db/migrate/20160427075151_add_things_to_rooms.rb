class AddThingsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :house_rules, :text
    add_column :rooms, :bus_train, :text
  end
end

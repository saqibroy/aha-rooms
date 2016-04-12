class AddThingToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :title, :string
    add_column :rooms, :short_desc, :string
  end
end

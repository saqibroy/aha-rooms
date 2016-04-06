class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.integer :rate
      t.integer :discount, default: 0
      t.boolean :available, default: true
      t.text :description
      t.integer :total_beds
      t.integer :total_people
      t.integer :meal

      t.timestamps null: false
    end
  end
end

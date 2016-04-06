class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :no_of_rooms
      t.integer :total_price
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

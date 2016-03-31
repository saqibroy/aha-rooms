class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :no_of_rooms
      t.decimal :total_price, :float_value, :precision => 4, :scale => 3
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

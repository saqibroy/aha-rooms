class AddRateAfterDiscToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :rate_after_disc, :float
  end
end

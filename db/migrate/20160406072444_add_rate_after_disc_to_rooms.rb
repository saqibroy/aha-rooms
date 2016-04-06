class AddRateAfterDiscToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :rate_after_disc, :float,:precision => 16, :scale => 16
  end
end

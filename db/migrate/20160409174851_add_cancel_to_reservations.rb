class AddCancelToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :cancel, :boolean, default: false
  end
end

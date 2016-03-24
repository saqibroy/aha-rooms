class RemoveImageFromRoomImages < ActiveRecord::Migration
  def change
    remove_column :room_images, :image, :string
  end
end

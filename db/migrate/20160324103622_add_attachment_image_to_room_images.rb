class AddAttachmentImageToRoomImages < ActiveRecord::Migration
  def self.up
    change_table :room_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :room_images, :image
  end
end

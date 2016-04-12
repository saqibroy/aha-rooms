class RoomImage < ActiveRecord::Base
	belongs_to :room
	has_attached_file :image, styles: { medium: "356x228>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

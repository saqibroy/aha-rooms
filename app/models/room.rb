class Room < ActiveRecord::Base
	belongs_to :hotel
	has_many :features
	has_many :room_images
	accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :room_images, reject_if: :all_blank, allow_destroy: true
end

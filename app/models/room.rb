class Room < ActiveRecord::Base
	belongs_to :hotel
	has_many :features, dependent: :destroy 
	has_many :room_images, dependent: :destroy 
	has_many :reservations, dependent: :destroy 
	has_many :testimonials, dependent: :destroy 
	accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :room_images, reject_if: :all_blank, allow_destroy: true
end

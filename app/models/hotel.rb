class Hotel < ActiveRecord::Base
	belongs_to :user
	has_many :rooms
	has_attached_file :image, styles: { medium: "800x250>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

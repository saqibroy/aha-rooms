class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, styles: { thumb: "200x200>", thumbb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :hotels
  has_many :reservations
  has_many :testimonials
end

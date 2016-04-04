class Reservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :room
	def start_time
    check_in_date
    end
    def end_time
    	check_out_date
    end
end

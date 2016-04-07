class ReservationMailer < ApplicationMailer
	 default from: "saqibsohail007@gmail.com"
	 def reservation_email(reservation)
    @user = reservation.user
    @admin= reservation.room.hotel.user
    @reservation= reservation

    
    mail(to: @admin.email, subject: 'New Reservation Detail')
    
  end
end

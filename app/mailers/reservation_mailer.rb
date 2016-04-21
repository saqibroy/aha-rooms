class ReservationMailer < ApplicationMailer
	 default from: "octasolutionx@gmail.com"
	 def reservation_email(reservation)
    @user = reservation.user
    @recipients = [@user.email]
    @recipients << reservation.room.hotel.user.email if reservation.room.hotel.user
    @recipients << "octasolutionx@gmail.com" 
    @reservation= reservation

    mail(to: @recipients, subject: 'Booking Detail')
    end
end

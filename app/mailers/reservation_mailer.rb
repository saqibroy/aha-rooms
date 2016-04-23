class ReservationMailer < ApplicationMailer
	 default from: "bookings@aha-rooms.com"
	 def reservation_email(reservation)
    @user = reservation.user
    @recipients = [@user.email]
    @recipients << reservation.room.hotel.user.email if reservation.room.hotel.user
    @recipients << "admin@aha-rooms.com" 
    @reservation= reservation

    mail(to: @recipients, subject: 'Booking Detail')
    end
end

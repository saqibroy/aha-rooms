class ReservationMailer < ApplicationMailer
	 default from: "octasolutionx@gmail.com"
	 def reservation_email(reservation)
    @user = reservation.user
    @admin= reservation.room.hotel.user
    @reservation= reservation

    mail(to: @user.email, subject: 'Reservation Detail')
    mail(to: @admin.email, subject: 'New Reservation Detail')
    mail(to: "octasolutionx@gmail.com", subject: 'New Reservation Detail')
  end
end

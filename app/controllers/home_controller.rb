class HomeController < ApplicationController
  def index
  	@rooms= Room.all.order("RANDOM()").limit(3)
  	@testimonials= Testimonial.all.limit(2)
  	@testimonialsR= Testimonial.all.order("RANDOM()").limit(2)
  end
  def reservation_new
  	
  	@room=Room.find(params[:id])
  	@rp= reservation_params
  	 

  	if Room.all.where("id NOT IN (SELECT room_id FROM reservations WHERE ? < check_out_date AND ? > check_in_date)",@rp[:check_in_date].to_date.beginning_of_day,@rp[:check_out_date].to_date.beginning_of_day).exists?(params[:id])
  		@reservation= current_user.reservations.build(reservation_params)
    @reservation.total_price= @reservation.room.rate_after_disc.to_i * (@reservation.check_out_date.strftime("%d").to_i - @reservation.check_in_date.strftime("%d").to_i)
    @reservation.total_price= @reservation.total_price * @reservation.no_of_rooms
    respond_to do |format|
      if @reservation.save
        ReservationMailer.reservation_email(@reservation).deliver
      	@mes= "Room was Successfully reserved"
        format.html {   }
        format.json { render :index, status: :created, location: @reservation }
      else
        format.html { render :index }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
  end
  else
  	@mes= "Room already reserved on this date"
  	end
    

  end
  def contact
  	
  end
  def about
  	
  end





  private
  def reservation_params
      params.require(:reservation).permit(:no_of_rooms,:cancel, :total_price, :check_in_date, :check_out_date, :room_id, :user_id,:guests)
  end
end

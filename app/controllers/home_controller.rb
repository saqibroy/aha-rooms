class HomeController < ApplicationController
  def index
  	@rooms= Room.all.order("RANDOM()").limit(3)
  	@testimonials= Testimonial.all.limit(2)
  	@testimonialsR= Testimonial.all.order("RANDOM()").limit(2)
  end
  def reservation_new
  	@reservation=  params.require(:reservation).permit(:no_of_rooms,:cancel, :total_price, :check_in_date, :check_out_date, :room_id, :user_id,:guests)
  	@room=Room.find(params[:id])
  	@reservation[:total_price]= @room.rate_after_disc.to_i * (@reservation[:check_out_date].to_i - @reservation[:check_in_date].to_i)
    @reservation[:total_price]= @reservation[:total_price].to_i * @reservation[:no_of_rooms].to_i

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

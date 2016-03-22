class AdminController < ApplicationController
	before_action :authenticate_user!
  def index
  	if current_user.admin?
  		@hotel_count= Hotel.all.count
  	elsif current_user.user_type == 'Admin'
      @hotel_count= current_user.hotels.all.count
    else
  		redirect_to root_url, notice: "Only admin has access to this page"
  	end
  end
  def hotels
  	if current_user.admin?
      @hotels= Hotel.all
    elsif current_user.user_type == 'Admin'
      @hotels= current_user.hotels.all
    else
      redirect_to root_url, notice: "Only admin has access to this page"
    end
  end
  def hotel_show
    @hotel= Hotel.find(params[:id])
  end
  def rooms
    @hotel= Hotel.find(params[:id])
    @rooms= @hotel.rooms.all
  end
end

class AdminController < ApplicationController
	before_action :authenticate_user!
  def index
  	if current_user.user_type == "superAdmin"
  		@hotel_count= Hotel.all.count
      @rc= User.all.where(admin: false).count
  	elsif current_user.user_type == 'Admin'
      @hotel_count= current_user.hotels.all.count
    else
  		redirect_to root_url, notice: "Only admin has access to this page"
  	end
  end
  def hotels
  	if current_user.user_type == "superAdmin"
      @hotels= Hotel.all
    elsif current_user.user_type == 'Admin'
      @hotels= current_user.hotels.all
    else
      redirect_to root_url, notice: "Only admin has access to this page"
    end
  end
  def hotel_show
    @hotel= Hotel.find(params[:id])
    @ar= @hotel.rooms.all.where(available: true)
  end
  def rooms
    @hotel= Hotel.find(params[:id])
    @rooms= @hotel.rooms.all
  end
  def room_show
    @room= Room.find(params[:id])
  end
  def image_delete
    @im= RoomImage.find(params[:id])
    @im.destroy
    respond_to do |format|
      format.html { redirect_to admin_rooms_path, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def user_request
    if current_user.user_type == "superAdmin"
    @users= User.all.where(admin: false)
  else
    redirect_to admin_index_path, notice: "Only super admin has access to this page"
  end
  end
  def user_request_done
    @user= User.find(params[:id])
    @user.admin= true
    @user.save
    redirect_to admin_user_request_path
  end
end

class AdminController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user, only: [ :user_edit, :user_update, :user_destroy]
  def index
  	if current_user.user_type == "superAdmin"
  		@hotel_count= Hotel.all.count
      @rc= User.all.where(admin: false).count
  	elsif current_user.user_type == 'Admin'
      @hotel_count= current_user.hotels.all.count
    else
  		
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
    @disc= 100 - @room.discount
    @val= @disc/100
    @dis= @val * @room.rate
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
    @users= User.all.where(admin: false,user_type: "Admin")
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
  def user_destroy
    
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_request_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def user_data
    if current_user.user_type == "superAdmin"
       @users= User.all
     elsif current_user.user_type == "Admin"
       @users= User.all.where(user_type: "User")
    end
   
    respond_to do |format|
      format.html

    end
  end
  def user_new
    @user = User.new
  end
  
  def user_create
    @user = User.new(user_params)
    if current_user.user_type == "Admin"
      @user.user_type= "User"
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_data_path, notice: 'User was successfully created.' }
        format.json { render :user_data, status: :created, location: @user }
      else
        format.html { render :user_new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def user_edit
    
  end
  def user_update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_data_path, notice: 'User was successfully updated.' }
        format.json { render :user_data, status: :ok, location: @user }
      else
        format.html { render :user_edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  private
  def set_user
      @user = User.find(params[:id])
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type,:admin)
    end
  
end

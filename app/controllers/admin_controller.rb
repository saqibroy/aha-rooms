class AdminController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user, only: [ :user_edit, :user_update, :user_destroy]
  before_action :set_feature, only: [ :feature_destroy]
  layout false


  def index
  	if current_user.user_type == "superAdmin"
  		@hotel_count= Hotel.all.count
      @rc= User.all.where(admin: false,user_type: "Admin").count
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

def feature_destroy
    
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to admin_features_path, notice: 'feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def features
    @features= MainFeature.all
    
  end
  def feature_new
    @feature = MainFeature.new
  end
  
  def feature_create
    @feature = MainFeature.new(feature_params)
    

    respond_to do |format|
      if @feature.save
        format.html { redirect_to admin_features_path, notice: 'feature was successfully created.' }
        format.json { render :features, status: :created, location: @feature }
      else
        format.html { render :feature_new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def reservation_cancel
    @reservation= Reservation.find(params[:id])
    if @reservation.cancel?
      redirect_to reservations_path,notice: 'You already requested for cancel reservation, Wait for Admins approvel'
      
      else
        @reservation.cancel= true
        @reservation.save
        redirect_to reservations_path,notice: 'Your cancelation request sent successfully, Wait for Admins approvel'
    end
  end

  def cancel_requests
    @reservations= Reservation.all.where(cancel: true)
  end

  def request_deny
    @reservation= Reservation.find(params[:id])
    @reservation.cancel = false
    @reservation.save
    redirect_to admin_cancel_requests_path,notice: 'Your successfully denied the cancelation request.'
  end

  def testimonial_new
    @room= Room.find(params[:id])
    @testimonial = current_user.testimonials.build

  end
  
  def testimonial_create
    
    @testimonial = current_user.testimonials.build(testimonial_params)
    @testimonial.room_id= params[:id]
    

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to reservations_path, notice: 'testimonial was successfully created.' }
        format.json { render :testimonial_new, status: :created, location: @testimonial }
      else
        format.html { render :testimonial_new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
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
   def set_feature
      @feature = MainFeature.find(params[:id])
   end
   def feature_params
      params.require(:main_feature).permit(:name)
    end
   def testimonial_params
      params.require(:testimonial).permit(:content)
    end



end

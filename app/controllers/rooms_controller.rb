class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show,:new,:edit,:destroy]
  

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @rooms= Room.all.order("RANDOM()").limit(3)
    @reservation=current_user.reservations.build
  end

  # GET /rooms/new
  def new
    @hotel= Hotel.find(params[:id])
    @room = @hotel.rooms.build
    render layout: false
  end

  # GET /rooms/1/edit
  def edit
    render layout: false
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @hotel= Hotel.find(params[:id])
    @room = @hotel.rooms.build(room_params)
    disc= 100 - @room.discount.to_f
    val= (disc/100).to_f
    @room.rate_after_disc= (val * @room.rate).to_f
    

    respond_to do |format|
      if @room.save
        format.html { redirect_to admin_rooms_path(id: @hotel.id), notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        disc= 100 - @room.discount.to_f
        val= (disc/100).to_f
        @room.rate_after_disc= (val * @room.rate).to_f
        @room.save
        format.html { redirect_to admin_rooms_path(id: @room.hotel.id), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to admin_rooms_path(id: @room.hotel.id), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_no,:title, :rate,:rate_after_disc, :discount, :description,:short_desc, :total_beds, :total_people, :meal,features_attributes:[:id, :name, :_destroy],room_images_attributes: [:id, :image, :_destroy])
    end
end

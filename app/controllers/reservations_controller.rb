class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :create]

  # GET /reservations
  # GET /reservations.json
  def index
    if current_user.user_type == "User"
      @reservations = current_user.reservations.all
    elsif current_user.user_type == "Admin"
      @reservations = current_user.hotels.rooms.reservations.all
      else
      @reservations = Reservation.all
    end
    
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = @room.reservations.build
    @reservations= @room.reservations.all
    @dates= []
    @reservations.each do |r|
      @dates.push({start: r.check_in_date , end: r.check_out_date})
    end
    
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = @room.reservations.build(reservation_params)
    @reservation.total_price= @reservation.room.rate_after_disc.to_i * (@reservation.check_out_date.strftime("%d").to_i - @reservation.check_in_date.strftime("%d").to_i)

    respond_to do |format|
      if @reservation.save
        ReservationMailer.reservation_email(@reservation)
        format.html { redirect_to new_reservation_path(id: @reservation.room.id), notice: 'Reservation was successfully created.Please check your email.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        @reservation.total_price= @reservation.room.rate_after_disc.to_i * (@reservation.check_out_date.strftime("%d").to_i - @reservation.check_in_date.strftime("%d").to_i)
        @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:no_of_rooms, :total_price, :check_in_date, :check_out_date, :room_id, :user_id)
    end
    def set_room
      @room= Room.find(params[:id])
    end
end

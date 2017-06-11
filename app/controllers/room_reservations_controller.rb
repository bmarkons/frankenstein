class RoomReservationsController < ApplicationController
  before_action :set_room_reservation, only: [:show, :edit, :update, :destroy]

  # GET /room_reservations
  # GET /room_reservations.json
  def index
    @room_reservations = RoomReservation.all
  end

  # GET /room_reservations/1
  # GET /room_reservations/1.json
  def show
  end

  # GET /room_reservations/new
  def new
    @room_reservation = RoomReservation.new
  end

  # GET /room_reservations/1/edit
  def edit
  end

  # POST /room_reservations
  # POST /room_reservations.json
  def create
    @room_reservation = RoomReservation.new(room_reservation_params)

    respond_to do |format|
      if @room_reservation.save
        format.html { redirect_to @room_reservation, notice: 'Room reservation was successfully created.' }
        format.json { render :show, status: :created, location: @room_reservation }
      else
        format.html { render :new }
        format.json { render json: @room_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_reservations/1
  # PATCH/PUT /room_reservations/1.json
  def update
    respond_to do |format|
      if @room_reservation.update(room_reservation_params)
        format.html { redirect_to @room_reservation, notice: 'Room reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_reservation }
      else
        format.html { render :edit }
        format.json { render json: @room_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_reservations/1
  # DELETE /room_reservations/1.json
  def destroy
    @room_reservation.destroy
    respond_to do |format|
      format.html { redirect_to room_reservations_url, notice: 'Room reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_reservation
      @room_reservation = RoomReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_reservation_params
      params.require(:room_reservation).permit(:start_date, :end_date, :room_id)
    end
end

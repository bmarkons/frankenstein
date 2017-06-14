class RoomReservationsController < ApplicationController
  before_action :set_accommodation, :set_room, except: [:index, :show]
  before_action :set_room_reservation, only: [:show, :destroy]

  def index
    @room_reservations = if current_user.type == "admin"
                           RoomReservation.all
                         elsif current_user.type == "manager"
                           RoomReservation.managed_by(current_user)
                         elsif current_user.type == "user"
                           current_user.room_reservations
                         end
  end

  def show
  end

  def new
    @room_reservation = RoomReservation.new
  end

  def create
    @room_reservation = @room.room_reservations.build(room_reservation_params)
    @room_reservation.user = current_user

    if @room_reservation.save
      redirect_to @room_reservation, notice: 'Room reservation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @room_reservation.destroy
    respond_to do |format|
      format.html { redirect_to room_reservations_url, notice: 'Room reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_room_reservation
    @room_reservation = RoomReservation.find(params[:id])
  end

  def room_reservation_params
    params.require(:room_reservation).permit(:start_date, :end_date, :room_id, :user_id)
  end
end

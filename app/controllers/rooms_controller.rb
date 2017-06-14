class RoomsController < ApplicationController
  before_action :set_accommodation
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = @accommodation.rooms
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = @accommodation.rooms.build(room_params)

    if @room.save
      redirect_to accommodation_room_url(@accommodation, @room), notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to accommodation_room_url(@accommodation, @room), notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to accommodation_rooms_url, notice: 'Room was successfully destroyed.'
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def room_params
    params.require(:room).permit(:room_number, :bed_count, :description, :price_per_night, :accommodation_id)
  end
end

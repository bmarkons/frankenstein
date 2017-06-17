class ChangeRoomReservationDateType < ActiveRecord::Migration[5.0]
  def change
    change_column :room_reservations, :start_date, :date
    change_column :room_reservations, :end_date, :date
  end
end

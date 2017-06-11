class CreateRoomReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :room_reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end

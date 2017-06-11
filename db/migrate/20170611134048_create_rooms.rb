class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.integer :bed_count
      t.text :description
      t.float :price_per_night
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end

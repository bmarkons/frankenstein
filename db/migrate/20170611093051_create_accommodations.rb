class CreateAccommodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :average_grade
      t.float :latitude
      t.float :longitude
      t.text :image_url
      t.boolean :approved
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end

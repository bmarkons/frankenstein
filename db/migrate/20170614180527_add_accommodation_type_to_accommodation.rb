class AddAccommodationTypeToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_reference :accommodations, :accommodation_type, foreign_key: true
  end
end

class AddOwnerToAccommodations < ActiveRecord::Migration[5.0]
  def change
    add_reference :accommodations, :user, foreign_key: true
  end
end

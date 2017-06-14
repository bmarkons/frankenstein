class RoomReservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  scope :managed_by, -> (manager) {
    joins(room: :accommodation).where(accommodations: { user_id: manager })
  }
end

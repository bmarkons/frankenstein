class Room < ApplicationRecord
  belongs_to :accommodation
  has_many :room_reservations, :dependent => :destroy
end

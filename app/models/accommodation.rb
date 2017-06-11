class Accommodation < ApplicationRecord
  belongs_to :place
  has_many :rooms
end

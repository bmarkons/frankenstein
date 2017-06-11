class Accommodation < ApplicationRecord
  belongs_to :place
  has_many :rooms
  has_many :comments
end

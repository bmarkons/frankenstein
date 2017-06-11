class Place < ApplicationRecord
  belongs_to :region
  has_many :accommodations
end

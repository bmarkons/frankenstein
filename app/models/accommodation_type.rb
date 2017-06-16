class AccommodationType < ApplicationRecord
  has_many :accommodations, :dependent => :destroy
end

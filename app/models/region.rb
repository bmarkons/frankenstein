class Region < ApplicationRecord
  belongs_to :country
  has_many :places
end

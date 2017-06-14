class Region < ApplicationRecord
  belongs_to :country
  has_many :places, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end

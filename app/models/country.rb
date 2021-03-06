class Country < ApplicationRecord
  has_many :regions, :dependent => :destroy

  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code
end

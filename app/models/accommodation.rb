class Accommodation < ApplicationRecord
  belongs_to :place
  belongs_to :owner, class_name: "User"

  has_many :rooms
  has_many :comments

  scope :owned_by, -> (owner) { where(owner: owner) }

  def owned_by?(user)
    owner.id == user.id
  end
end

class Accommodation < ApplicationRecord
  belongs_to :place
  belongs_to :user
  belongs_to :accommodation_type

  has_many :rooms, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  scope :all_except_owned_by, -> (user) { where.not(user: user) }
  scope :approved, -> { where(approved: true) }

  def self.top10
  end

  def self.wait_any?
    Accommodation.exists?(approved: false)
  end

  def owned_by?(owner)
    owner.id == user.id
  end

  def commented_by?(user)
    Comment.exists?(user: user, accommodation: self)
  end
end

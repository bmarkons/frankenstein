class Accommodation < ApplicationRecord
  belongs_to :place
  belongs_to :user

  has_many :rooms
  has_many :comments

  scope :all_except_owned_by, -> (user) { where.not(user: user) }
  scope :approved, -> { where(approved: true) }

  def self.top10
    order(average_grade: :desc).first(10)
  end

  def owned_by?(owner)
    owner.id == user.id
  end
end

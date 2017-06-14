class Accommodation < ApplicationRecord
  belongs_to :place
  belongs_to :user

  has_many :rooms
  has_many :comments

  scope :owned_by, -> (user) { where(user: user) }
  scope :all_except_owned_by, -> (user) { where.not(user: user) }

  def owned_by?(owner)
    owner.id == user.id
  end

  def top10
    order(grade: :desc).first(10)
  end
end

class Comment < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user

  has_many :grades

  scope :managed_by, -> (manager) { where(accommodation: { user: manager }) }
  scope :posted_by, -> (user) { where(user: user) }

  def posted_by?(commenter)
    user.id == commenter.id
  end

  def average_grade
    unless grades.count == 0
      sum = grades.inject(0) { |sum, grade| sum + grade.value }
      sum.to_f / grades.count.to_f
    end
  end
end

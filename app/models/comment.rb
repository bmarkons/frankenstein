class Comment < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user

  scope :managed_by, -> (manager) { where(accommodation: { user: manager }) }
  scope :posted_by, -> (user) { where(user: user) }

  def posted_by?(commenter)
    user.id == commenter.id
  end
end

class Comment < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  User.inheritance_column = :proba

  has_many :accommodations
  has_many :room_reservations
  has_many :comments

  def admin?
    type == "admin"
  end

  def user?
    type == "user"
  end

  def manager?
    type == "manager"
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  User.inheritance_column = :proba

  has_many :accommodations, :dependent => :destroy
  has_many :room_reservations, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :grades, :dependent => :destroy

  def admin?
    type == "admin"
  end

  def user?
    type == "user"
  end

  def manager?
    type == "manager"
  end

  def grade(comment)
    if grade = Grade.find_by(comment: comment, user: self)
      grade.value
    end
  end

  def graded?(comment)
    Grade.find_by(comment: comment, user: self) ? true : false
  end
end

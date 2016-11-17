class User < ApplicationRecord
  has_many :user_rooms

  scope :QA, ->{joins(:user_rooms).where("user_rooms.role = ?", 2).distinct}
end

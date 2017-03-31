class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_rooms
  has_many :pull_notifications, class_name: "PullNotification", foreign_key: "action_owner_id"

  scope :QA, ->{joins(:user_rooms).where("user_rooms.role = ?", 2).distinct}
end

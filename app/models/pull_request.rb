class PullRequest < ApplicationRecord
  belongs_to :user_room

  belongs_to :merged_by, class_name: "User", foreign_key: "merged_by_id"

  scope :not_deployed, ->{where "(deployed is ? OR deployed = ?) AND merged = ?", nil, false, true}

  scope :filter_by_room, ->room_id do
    joins(:user_room).where "user_rooms.room_id = ?", room_id
  end
end

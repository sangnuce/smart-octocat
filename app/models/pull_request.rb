class PullRequest < ApplicationRecord
  belongs_to :user_room

  belongs_to :merged_by, class_name: "User", foreign_key: "merged_by_id"

  scope :not_deployed, ->{where "(deployed is ? OR deployed = ?) AND merged = ?", nil, false, true}
end

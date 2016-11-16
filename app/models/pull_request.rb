class PullRequest < ApplicationRecord
  belongs_to :user_room

  belongs_to :merged_by, class_name: "User", foreign_key: "merged_by_id"
end

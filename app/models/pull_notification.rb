class PullNotification < ApplicationRecord
  enum action: ["comment", "need_review", "close", "merge", "open"]

  belongs_to :pull_request
  belongs_to :action_owner, class_name: "User", foreign_key: "action_owner_id"

  scope :need_delete, -> do
    where "action <> ?", 1
  end

  scope :not_replied, ->{where "replied = ? OR replied IS NULL", false}
end

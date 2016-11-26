class PullNotification < ApplicationRecord
  enum action: ["comment", "need_review", "close", "merge", "open"]

  belongs_to :pull_request

  scope :need_delete, -> do
    where "action <> ?", 1
  end
end

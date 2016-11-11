class UserRoom < ApplicationRecord
	enum role: ["dev", "leader", "qa"]

  belongs_to :user
  belongs_to :room
end

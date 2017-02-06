class UserRoom < ApplicationRecord
	enum role: ["dev", "leader", "qa", "brse", "manager"]

  belongs_to :user
  belongs_to :room

  has_many :pull_requests, dependent: :destroy
end

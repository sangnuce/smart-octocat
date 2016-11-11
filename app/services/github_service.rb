class GithubService
  def initialize action, params
    @action = action
    @params = params

    @request = params["review"]
    @pull_request = params["pull_request"]
  end

  def get_message_to_send
    case @action
    when "pull_request_review"
      pull_owner = get_user_by_github_id @pull_request["user"]["login"]
      action_owner = get_user_by_github_id @request["user"]["login"]
      body = "[To:#{pull_owner.chatwork_id}] #{pull_owner.name}\n#{action_owner.name} has reviewed on your pull request."
    when "pull_request"
      pull_owner = get_user_by_github_id @pull_request["user"]["login"]
      room = Room.find_by project_github_link: ...

      reviewers = User.joins(:user_rooms).where "room_id = ? AND (user_rooms.role = ?
        OR user_rooms.role = ?", room.id, 0, 1
    end
  end

  # def get_user_request
  #   @request["user"]
  # end

  # def get_user_pull_request
  #   @pull_request ? @pull_request["user"] : nil
  # end

  def get_action_owner
    User.find_by github_id: @request["user"]["login"]
  end

  def get_pull_request_owner
    User.find_by github_id: @pull_request["user"]["login"]
  end

  def get_user_by_github_id github_id
    User.find_by github_id: github_id
  end
end

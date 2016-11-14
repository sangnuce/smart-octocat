class GithubService
  def initialize action, params
    @action = action
    @params = params

    @request = params["review"]
    @pull_request = params["pull_request"]
  end

  def get_message_to_send
    @room = Room.find_by project_github_link: @params["repository"]["html_url"]

    case @action
    when "pull_request_review"
      pull_owner = get_user_by_github_id @pull_request["user"]["login"]
      action_owner = get_user_by_github_id @request["user"]["login"]
      body = "[To:#{pull_owner.chatwork_id}] #{pull_owner.name}\n#{action_owner.name} " +
        "has (commented) on your pull request.\n" + @request["html_url"]
    when "pull_request"
      pull_owner = get_user_by_github_id @pull_request["user"]["login"]

      if @room
        if @pull_request["state"] == "open"
          reviewers = User.joins(:user_rooms).where "room_id = ? AND (user_rooms.role = ?
            OR user_rooms.role = ?)", @room.id, 0, 1
          to_part = reviewers.map {|reviewer| "[To:#{reviewer.chatwork_id}]"}
          to_part = to_part.join + "\n"

          body = to_part + "#{pull_owner.name} has a pull request, please review it.\n" +
            @pull_request["html_url"]
        elsif @pull_request["state"] == "closed"
          sender = get_user_by_github_id @params["sender"]["login"]
          body = "[To:#{pull_owner.chatwork_id}]#{pull_owner.name}\n" +
            "#{sender.name} has closed your pull request.\n" + @pull_request["html_url"]
        end
      else
        body = ""
      end
    when "push"
      pusher = get_user_by_github_id @params["pusher"]["name"]
      sender = get_user_by_github_id @params["sender"]["login"]

      body = "[To:#{sender.chatwork_id}]#{sender.name}\n#{pusher.name} has (merged) your pull request.\n" +
        @params["repository"]["html_url"]
    end

    [body, @room]
  end

  def get_room
    @room
  end

  def get_user_by_github_id github_id
    User.find_by github_id: github_id
  end
end

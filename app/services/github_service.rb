class GithubService
  def initialize action, params
    @action = action
    @params = params

    @request = params["review"]
  end

  def get_message_to_send
    @room = Room.find_by project_github_link: @params["repository"]["html_url"]

    body = ""
    case @action
    when "pull_request_review"
      pull_owner = get_user_by_github_id @params["pull_request"]["user"]["login"]
      action_owner = get_user_by_github_id @request["user"]["login"]
      body = "[To:#{pull_owner.chatwork_id}] #{pull_owner.name}\n#{action_owner.name} " +
        "has (commented) on your pull request.\n" + @request["html_url"]
    when "pull_request"
      pull_owner = get_user_by_github_id @params["pull_request"]["user"]["login"]
      sender = get_user_by_github_id @params["sender"]["login"]

      @pull_request = PullRequest.find_or_create_by(url: @params["pull_request"]["html_url"])
        
      reviewers = User.joins(:user_rooms).where "room_id = ? AND user_rooms.role = ?",
        @room.id, 0
      user_room = UserRoom.find_by user: pull_owner, room: @room
      @pull_request.update merged: @params["pull_request"]["merged"],
        state: @params["pull_request"]["state"], user_room: user_room,
        reviewer_num: reviewers.select{|reviewer| reviewer.id != pull_owner.id}.size

      if @pull_request.state == "open"
        to_part = reviewers.map do |reviewer|
          reviewer.id == pull_owner.id ? "" : "[To:#{reviewer.chatwork_id}]"
        end
        to_part = to_part.join + "\n"

        body = to_part + "#{pull_owner.name} has a pull request, please review it.\n" +
          @pull_request.url
      elsif @pull_request.state == "closed"
        if @pull_request.merged
          @pull_request.update merged_by: sender
          body = "[To:#{pull_owner.chatwork_id}]#{sender.name}\n#{sender.name} has (merged) your pull request.\n" +
            @params["repository"]["html_url"]
        else
          body = "[To:#{pull_owner.chatwork_id}]#{pull_owner.name}\n" +
          "#{sender.name} has closed your pull request.\n" + @pull_request.url
        end
      end
    when "issue_comment"
      @pull_request = PullRequest.find_by url: @params["issue"]["html_url"]
      current_ok = @pull_request.happy_reviewer_num || 0
      if @params["comment"]["body"].downcase == "ok"
        current_ok += 1
        @pull_request.update happy_reviewer_num: current_ok
      end

      if current_ok >= @pull_request.reviewer_num
        mergers = User.joins(:user_rooms).where "room_id = ? AND user_rooms.role = ?",
          @room.id, 1
        to_part = mergers.map {|merger| "[To:#{merger.chatwork_id}]"}
        to_part = to_part.join + "\n"

        body = to_part + "All reviewers are happy, please review it.\n" +
          @pull_request.url
      end
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

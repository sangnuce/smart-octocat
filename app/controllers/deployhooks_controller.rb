class DeployhooksController < ApplicationController
  def index
    room = Room.find_by project_github_link: params["repo"]
    qas = room.users.QA
    to_part = qas.map{|qa| "[To:#{qa.chatwork_id}]#{qa.name}"}
    to_part = to_part.join + "\n"

    not_deployed_pulls = PullRequest.filter_by_room(room.id).not_deployed

    if not_deployed_pulls.present?
      body = to_part
      not_deployed_pulls.each do |pull|
        pull.update deployed: true
        body += "[info][title]#{pull.title}[/title]" +
          "#{pull.description.presence || "Give me 1X pls."}[/info]"
      end
      http_request = HTTP.headers("X-ChatWorkToken" => ENV["chatwork_secret"])
        .post("https://api.chatwork.com/v1/rooms/#{room.chatwork_id}/messages", params: {body: body})
      puts http_request.to_s
    end

    render json: :nothing
  end
end

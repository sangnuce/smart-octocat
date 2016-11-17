class DeployhooksController < ApplicationController
  def index
    room = Room.find_by project_github_link: params["repo"]
    qas = room.users.QA
    to_part = qas.map{|qa| "[To:#{qa.chatwork_id}]#{qa.name}"}
    to_part = to_part.join + "\n"

    not_deployed_pulls = PullRequest.not_deployed

    message = ""
    not_deployed_pulls.each_with_index do |pull, index|
      title = pull.title || ""
      description = pull.description || ""
      pull.update deployed: true
      message += "#{index + 1}. " + title + "\n"
      message += description + "\n"
    end
    body = to_part + "All pull requests are deployed.(please)\n" + message

    if message.present?
      http_request = HTTP.headers("X-ChatWorkToken" => ENV["chatwork_secret"])
        .post("https://api.chatwork.com/v1/rooms/#{room.chatwork_id}/messages", params: {body: body})
      puts http_request.to_s
    end

    render json: :nothing
  end
end

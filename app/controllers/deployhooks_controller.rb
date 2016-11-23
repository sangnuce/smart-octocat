class DeployhooksController < ApplicationController
  def index
    room = Room.find_by project_github_link: params["repo"]
    qas = room.users.QA
    to_part = qas.map{|qa| "[To:#{qa.chatwork_id}]#{qa.name}"}
    to_part = to_part.join + "\n"

    # not_deployed_pulls = PullRequest.not_deployed
    not_deployed_pull = PullRequest.not_deployed.last

    # message = ""
    # not_deployed_pulls.each_with_index do |pull, index|
    #   title = pull.title || ""
    #   description = pull.description || ""
    #   pull.update deployed: true
    #   message += "#{index + 1}. " + title + "\n"
    #   message += description + "\n"
    # end

    if not_deployed_pull.present?
      not_deployed_pull.update deployed: true
      body = "#{to_part}[info][title]#{not_deployed_pull.title}[/title]" +
        "#{not_deployed_pull.description || "Nothing to say."}[/info]"

      http_request = HTTP.headers("X-ChatWorkToken" => ENV["chatwork_secret"])
        .post("https://api.chatwork.com/v1/rooms/#{room.chatwork_id}/messages", params: {body: body})
      puts http_request.to_s
    end

    render json: :nothing
  end
end

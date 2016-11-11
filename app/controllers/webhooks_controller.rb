require "http"

class WebhooksController < ApplicationController
  def index
    # Get info from github
    action = request.headers["X-GitHub-Event"]
    puts action

    github_service = GithubService.new action, params

    action_owner = github_service.get_action_owner
    pull_owner = github_service.get_pull_request_owner

    # Send message to chatwork
    body = "[To:#{pull_owner.chatwork_id}] #{pull_owner.name}\n#{action_owner.name} has reviewed on your pull request."
    http_request = HTTP.headers("X-ChatWorkToken" => "256a72efa51cd416b879d729eb794ee2")
      .post("https://api.chatwork.com/v1/rooms/51413536/messages", params: {body: body})
    puts http_request.to_s

    render json: :nothing
  end
end

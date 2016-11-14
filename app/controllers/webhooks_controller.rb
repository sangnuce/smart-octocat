require "http"

class WebhooksController < ApplicationController
  def index
    # Get info from github
    action = request.headers["X-GitHub-Event"]
    puts action

    github_service = GithubService.new action, params

    # action_owner = github_service.get_action_owner
    # pull_owner = github_service.get_pull_request_owner
    # body = "[To:#{pull_owner.chatwork_id}] #{pull_owner.name}\n#{action_owner.name} has reviewed on your pull request."


    # Send message to chatwork

    body_message, room = github_service.get_message_to_send

    http_request = HTTP.headers("X-ChatWorkToken" => ENV["chatwork_secret"])
      .post("https://api.chatwork.com/v1/rooms/#{room.chatwork_id}/messages", params: {body: body_message})
    puts http_request.to_s

    render json: :nothing
  end
end

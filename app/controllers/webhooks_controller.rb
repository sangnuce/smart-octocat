class WebhooksController < ApplicationController
  def index
    action = request.headers["X-GitHub-Event"]
    case action
    # when "pull_request_review_comment"
    #   request = params["comment"]
    when "pull_request_review"
      request = params["review"]
      request_owner = request["user"]
      pull_owner = params["pull_request"]["user"]

      puts "#{request_owner["login"]} has reviewed on pull of #{pull_owner["login"]}"
      puts request["html_url"]
    end

    render json: :nothing
  end
end

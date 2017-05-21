require "http"

class WebhooksController < ApplicationController
  def index
    # Get info from github
    action = request.headers["X-GitHub-Event"]
    puts action

    github_service = GithubService.new action, params

    # Send message to chatwork

    body_message, room, pull_request, real_action, action_owner = github_service.get_message_to_send

    http_request = HTTP.headers("X-ChatWorkToken" => ENV["chatwork_secret"])
      .post("https://api.chatwork.com/v2/rooms/#{room.chatwork_id}/messages", params: {body: body_message})
    puts http_request.to_s

    message_id = JSON.parse(http_request.body.to_s)["message_id"]
    PullNotification.create pull_request: pull_request, chatwork_message_id: message_id,
      action: real_action, action_owner: action_owner

    if real_action == "merge"
      need_delete_notis = PullNotification.where(pull_request: pull_request).need_delete
      delete_message room.id, need_delete_notis.map{|noti| noti.chatwork_message_id}
    end

    render json: :nothing
  end

  private
  def delete_message room_id, message_ids
    message_ids.each do |message_id|
      a = HTTP.headers(
        "Cookie" => ENV["cookie"],
        "X-NewRelic-ID" => ENV["new_relic_id"],
        "DNT" => ENV["dnt"],
        "Accept-Encoding" => ENV["accept_encoding"],
        "Accept-Language" => ENV["accept_language"],
        "User-Agent" => ENV["user_agent"],
        "Accept" => ENV["accept"],
        "Referer" => ENV["referer"],
        "X-Requested-With" => ENV["requested_with"],
        "Connection" => ENV["connection"]
      ).post("https://www.chatwork.com/gateway.php", params: {
        cmd: "delete_chat",
        myid: "1565457",
        _v: "1.80a",
        _av: "5",
        _t: "d2655c72f549159daaf40b6a4d7d5678b44477ff5838f13aede40",
        # _t: "ceeb5d35cd1f2c9fed38e40c71fdea1ed3e701965838ed0e105fa",
        ln: "en",
        chat_id: message_id,
        room_id: room_id,
        _: "1480125712162"})
      puts a.to_s
    end
  end
end

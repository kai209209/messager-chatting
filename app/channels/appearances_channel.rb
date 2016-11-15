# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearancesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    redis.set("user_#{current_user.id}_online", "1")
    stream_from("appearances_channel")
    ActionCable.server.broadcast "appearances_channel", user_id: current_user.id, online: true
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    redis.del("user_#{current_user.id}_online")
    ActionCable.server.broadcast "appearances_channel", user_id: current_user.id, online: false
  end

  private
  def redis
    Redis.new
  end
end

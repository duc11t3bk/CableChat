class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params[:chat_room_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive data
    ActionCable.server.broadcast "chat_rooms_#{data["chat_room_id"]}_channel",
      message: data["message"], time_stamp: data["time_stamp"]
  end
end

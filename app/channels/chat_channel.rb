class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ChatChannel.broadcast_to("chat_#{params[:room]}", data)
  end
end

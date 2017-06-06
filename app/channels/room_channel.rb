class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.debug 'Subscribed RoomChannel'
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    logger.debug 'Called speak method'
    Message.create! content: data['message']
  end
end

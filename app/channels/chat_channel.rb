class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "speak"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    data['time_ms'] = Time.now.to_f * 1000
    ActionCable.server.broadcast("speak", data)
  end
end

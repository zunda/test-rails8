class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "speak"
    stream_from "report"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def report(data)
    data["time_ms"] = Time.now.to_f * 1000
    ActionCable.server.broadcast("speak", data)
  end

  def speak(data)
    report(data)
    station = data["message"]
    if station&.match(LookupMetarJob::ICAO_REGEXP)
      LookupMetarJob.perform_later(station)
    end
  end
end

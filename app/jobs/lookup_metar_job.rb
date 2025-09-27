require 'net/http'
require 'uri'

class LookupMetarJob < ApplicationJob
  queue_as :default
  AVIATION_WEATHER_SERVER = "aviationweather.gov"
  ICAO_REGEXP = /\A[A-Z]{4}\z/

  def perform(station)
    unless station =~ ICAO_REGEXP
      raise "#{station.inspect} isn't an ICAO airport code"
    end
    metar = Net::HTTP.get(URI("https://#{AVIATION_WEATHER_SERVER}/api/data/metar?ids=#{station}"))
    timestamp = Time.now.to_f * 1000
    ActionCable.server.broadcast("report", {time_ms: timestamp, message: metar})
  end
end

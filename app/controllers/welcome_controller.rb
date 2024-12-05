class WelcomeController < ApplicationController
  def index
    @cached_time = Rails.cache.fetch("cached_time", expires_in: 1.minute) do
      Time.now
    end
    @host = ENV.fetch("DYNO", `hostname`).strip
  end
end

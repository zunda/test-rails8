class WelcomeController < ApplicationController
  def index
    @cached_time = Rails.cache.fetch("cached_time", expires_in: 5.seconds) do
      Time.now
    end
    @host = ENV.fetch('DYNO', `hostname`).strip
  end
end

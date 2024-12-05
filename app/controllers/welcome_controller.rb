class WelcomeController < ApplicationController
  def index
    @cached_time = Rails.cache.fetch("cached_time") do
      Time.now
    end
    @host = ENV.fetch("DYNO", `hostname`).strip
  end
end

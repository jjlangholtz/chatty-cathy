class HomeController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = User.find(3).token
      config.access_token_secret = User.find(3).secret
    end

    @timeline = client.home_timeline
  end
end

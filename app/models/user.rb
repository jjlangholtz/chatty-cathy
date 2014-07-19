class User < ActiveRecord::Base
  def timeline
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end

    client.home_timeline(count: 200)
  end
end

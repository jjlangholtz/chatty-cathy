class User < ActiveRecord::Base
  def followers
    followers = Hash.new(0)

    timeline.each do |tweet|
      followers[tweet.user.name] += 1
    end

    followers
  end

  private

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

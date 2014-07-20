class User < ActiveRecord::Base
  def followees
    followees = Hash.new(0)

    timeline.each do |tweet|
      followees[tweet.user] += 1
    end

    followees.sort_by { |name, count| count }.reverse
  end

  def unfollow_user(user)
    twitter_client
    @client.post '/1.1/friendships/destroy.json', user_id: user
  end

  private

  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
  end

  def timeline
    twitter_client
    @client.home_timeline(count: 200)
  end
end

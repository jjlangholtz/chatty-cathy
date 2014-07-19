class User < ActiveRecord::Base
  def followers
    followers = Hash.new(0)

    timeline.each do |tweet|
      followers[tweet.user.name] += 1
    end

    followers.sort_by { |name, count| count }.reverse
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

  def unfollow_user(user)
    twitter_client
    friendship_to_destroy = timeline[user].user.uid
    @client.post 'https://api.twitter.com/1.1/friendships/destroy.json', user_id: friendship_to_destroy
  end
end

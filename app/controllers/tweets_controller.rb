class TweetsController < ApplicationController
  def tweet
    @user = current_user
    @user.tweet(params[:message])
    redirect_to root_url, notice: 'Your message has been Tweeted.'
  end
end

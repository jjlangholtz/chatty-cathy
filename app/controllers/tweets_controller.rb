class TweetsController < ApplicationController
  def tweet
    @user = current_user
    @user.tweet(params[:message])
    redirect_to root_url
  end

end

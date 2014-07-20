class FriendshipsController < ApplicationController
  def destroy
    @user = current_user
    @user.unfollow_user(params[:uid])
    redirect_to root_url, notice: "You have stopped following a chatty cathy."
  end
end

class HomeController < ApplicationController
  def index
    @user = current_user
    @followers = @user.followers
  end
end

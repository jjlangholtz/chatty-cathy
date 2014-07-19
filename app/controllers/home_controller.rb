class HomeController < ApplicationController
  before_action :authenticate

  def index
    @user = current_user
    @followers = @user.followers
  end
end

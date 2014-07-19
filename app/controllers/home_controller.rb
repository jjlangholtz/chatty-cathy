class HomeController < ApplicationController
  def index
    @user = User.find(3)
    @timeline = @user.timeline
  end
end

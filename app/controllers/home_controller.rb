class HomeController < ApplicationController
  before_action :authenticate

  def index
    @user = current_user
    @followees = @user.followees
  end
end

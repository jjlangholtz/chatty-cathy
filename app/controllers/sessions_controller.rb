class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(name: auth_hash[:info][:name], provider: auth_hash[:provider],
                                   uid: auth_hash[:uid], token: auth_hash[:credentials][:token],
                                   secret: auth_hash[:credentials][:secret])
    session[:current_user_id] = @user.id
    redirect_to root_url, notice: 'You have successfully logged in.'
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: 'You have successfully logged out.'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end

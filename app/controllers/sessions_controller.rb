class SessionsController < ApplicationController

  def create
    # find_or_create_from_hash method is defined in app/models/users.rb
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def destroy
    reset_session
    redirect_to '/', notice: "Logged out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

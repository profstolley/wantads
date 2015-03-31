class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # Method to determine or set the current user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Method to determine whether a user is signed in or not
  def user_signed_in?
    !!current_user
  end

  helper_method :current_user, :user_signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
    session[:user_name] = user.name
  end

  private

  def authenticate_user!
    # could this be unless self.user_signed_in? ?
    if session[:user_id].nil?
      redirect_to '/', alert: 'Please log in first'
    end
  end

end

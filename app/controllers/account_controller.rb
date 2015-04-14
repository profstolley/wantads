class AccountController < ApplicationController
  before_action :authenticate_user!
  def index
    # Grab all of the logged-in users ads
    @ads = Ad.where(user_id: current_user.id)
    # Create a placeholder new ad for on-list form
    @ad = Ad.new
  end
end

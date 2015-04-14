class AccountController < ApplicationController
  before_action :authenticate_user!
  def index
    @ads = Ad.where(user_id: current_user.id)
  end
end

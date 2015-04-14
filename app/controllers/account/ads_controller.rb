class Account::AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_own_ad, only: [:edit, :update, :destroy]

  # GET /account/ads/new
  def new
    @ad = Ad.new
  end

  # GET /account/ads/1/edit
  def edit
  end

  # POST /account/ads
  # POST /account/ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id

    respond_to do |format|
      if @ad.save
        format.html { redirect_to public_ad_path(@ad), notice: 'Ad was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/ads/1
  # PATCH/PUT /account/ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to public_ad_path(@ad), notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/ads/1
  # DELETE /account/ads/1.json
  def destroy
    @ad.destroy
    @ads = Ad.where(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to account_url, notice: 'Ad was successfully deleted.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_own_ad
      @ad = Ad.find_by_id_and_user_id(params[:id], current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description)
    end
end

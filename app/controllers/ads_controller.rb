class AdsController < ApplicationController
  before_action :set_ad, only: [:show]

  # GET /
  # GET /.json
  def index
    @ads = Ad.all
  end

  # GET /1
  # GET /1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description)
    end
end

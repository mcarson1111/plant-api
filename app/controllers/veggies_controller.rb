class VeggiesController < ApplicationController
  before_action :set_veggie, only: [:show, :edit, :update, :destroy]

  # for companions, return as an array?
  # alphbetize companions
  # make sure to downcase everything

  # this doesnt have a route
  def index
    @veggies = Veggies.all

  end

  def find(soil_type, hardy_zone)
    @soil = soil_type
    @zone = hardy_zone

    @veggies = Veggie.where("soil like ?", "%#{@soil}%").where("hardiness_zone like?", "%#{@zone}%")

# veggies = Veggie.where("soil like ?", "%loamy%").where("hardiness_zone like?", "%10%")
# Veggie.where("soil like ?", soil).where("hardiness_zone like?", "%10%") <= this returns veggies with ONLY loamy as their soil type

# the info comes back from the active record query as an array of hashes, sooooo....
  render json: @veggies

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veggie
      @veggie = Veggie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veggie_params
      params.require(:veggie).permit(:name, :soil, :space, :hardiness_zone, :sun, :start, :special, :companions, :foes)
    end
end

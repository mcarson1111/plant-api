class FlowersController < ApplicationController
  before_action :set_flower, only: [:show, :edit, :update, :destroy]

# this doesnt have a route
  def index
    @flowers = Flowers.all

  end

  #herbs is an *array* of the herb types the user picked and sent over
  def find (veggies, fruits, herbs)
    @fruits = fruits
    @veggies = veggies
    @herbs = herbs

    @flowers = [ ]
    @herbs.each do |herb|
      @flowers += Flower.where("companions like ?", "%#{herb}%")
    end

    @fruits.each do |fruit|
      @flowers += Flower.where("companions like ?", "%#{fruit}%")
    end

    @veggies.each do |veggie|
      @flowers += Flower.where("companions like ?", "%#{veggie}%")
    end


    @flowers.uniq

    render json: @flowers


  def skip((soil_type, hardy_zone))
    @soil = soil_type
    @zone = hardy_zone

    @flowers = Flower.where("soil like ?", "%#{@soil}%").where("hardiness_zone like?", "%#{@zone}%")

  render json: @flowers

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flower
      @flower = Flower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flower_params
      params.require(:flower).permit(:name, :soil, :space, :hardiness_zone, :sun, :start, :special, :companions, :foes)
    end
end

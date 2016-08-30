class FlowersController < ApplicationController
  before_action :set_flower, only: [:show, :edit, :update, :destroy]

# this doesnt have a route
  def index
    @flowers = Flowers.all

  end

  #herbs is an *array* of the herb types the user picked and sent over
  def find
    @fruits = params[:fruits].split(',')
    @veggies = params[:veggies].split(',')
    @herbs = params[:herbs].split(',')

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
  end

    def skip
      @soil = params[:soil]
      @zone = params[:zone]

      @flowers = Flower.where("soil like ?", "%#{@soil}%").where("hardinessZone like?", "%#{@zone}%")

      render json: @flowers

    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flower
      @flower = Flower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flower_params
      params.require(:flower).permit(:name, :soil, :space, :hardinessZone, :sunShine, :start, :special, :companions, :foes)
    end
end

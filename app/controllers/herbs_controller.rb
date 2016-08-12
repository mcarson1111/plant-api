class HerbsController < ApplicationController
  before_action :set_herb, only: [:show, :edit, :update, :destroy]

# this doesnt have a route
  def index
    @herbs = Herbs.all

  end

  #fruits is an *array* of the fruit types the user picked and sent over
  def find
    @fruits = params[:fruits].split(',')
    @veggies = params[:veggies].split(',')


    @herbs = [ ]
    @fruits.each do |fruit|
      @herbs += Herb.where("companions like ?", "%#{fruit}%")
    end

    @veggies.each do |veggie|
      @herbs += Herb.where("companions like ?", "%#{veggie}%")
    end


    @herbs.uniq!

    render json: @herbs

    # ***WHAT IF THERE ARE NO MATCHES?

  end



  def skip
    @soil = params[:soil]
    @zone = params[:zone]

    @herbs = Herb.where("soil like ?", "%#{@soil}%").where("hardiness_zone like?", "%#{@zone}%")

  render json: @herbs

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herb
      @herb = Herb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def herb_params
      params.require(:herb).permit(:name, :soil, :space, :hardiness_zone, :sun, :start, :special, :companions, :foes)
    end
end

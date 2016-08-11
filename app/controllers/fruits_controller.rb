class FruitsController < ApplicationController
  before_action :set_fruit, only: [:show, :edit, :update, :destroy]

# this doesnt have a route
  def index
    @fruits = Fruits.all

  end

  #veggies is an *array* of the veggie types the user picked and sent over
  def find (veggies)
    @veggies = veggies

    @fruits = [ ]
    @veggies.each do |veggie|
      @fruits += Fruit.where("companions like ?", "%#{veggie}%")
    end

    @fruits.uniq

    render json: @fruits
    # ***WHAT IF THERE ARE NO MATCHES?****
  

  end



  def skip((soil_type, hardy_zone))
    @soil = soil_type
    @zone = hardy_zone

    @fruits = Fruit.where("soil like ?", "%#{@soil}%").where("hardiness_zone like?", "%#{@zone}%")

  render json: @fruits

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fruit
      @fruit = Fruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fruit_params
      params.require(:fruit).permit(:name, :soil, :space, :hardiness_zone, :sun, :start, :special, :companions, :foes)
    end
end

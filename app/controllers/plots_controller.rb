class PlotsController < ApplicationController
  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(user_create_params[:plot])
  end


  private

  def plot_create_params
    params.permit(plot: [:user_id, :width, :length])
  end
end

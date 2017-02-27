class DirectionsController < ApplicationController

  def show
    @location = Location.find_by_id(params[:id])
    @destination = Destination.find_by_id(params[:id])
  end
end

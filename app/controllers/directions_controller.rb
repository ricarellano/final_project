class DirectionsController < ApplicationController

  def show
    @location = Location.find_by_id(params[:id])
    @destination = Destination.find_by_id(params[:id])
    @distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@destination.latitude,@destination.longitude])
    render :show
  end


end

class LocationsController < ApplicationController
skip_before_filter :verify_authenticity_token
  def index
    @location = Location.last
    @destination = Destination.last
  

    # @location = Location.find_by_id(params[:id])
  #   @hash = Gmaps4rails.build_markers(@location, @destination) do | location, destination, marker|
  #   marker.lat location.latitude
  #   marker.lng location.longitude
  #   marker.lat destination.latitude
  #   marker.lng destination.longitudeGam
   #
  #  end
  end

  def show
    @location = Location.find_by_id(params[:id])
  end

  def create
    @location = Location.create(location_params)
    @location = Destination.create(destination_params)
    redirect_to locations_path
  end

  def new
    @location = Location.new

  end

  private

 def location_params
   params.require(:location).permit(:address)
 end
 def destination_params
   params.require(:destination).permit(:address2)
 end
end

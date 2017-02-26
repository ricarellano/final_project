class LocationsController < ApplicationController
skip_before_filter :verify_authenticity_token
require 'strava/api/v3'

@client = Strava::Api::V3::Client.new(:access_token => "df59fec7116ab07f292dbd7440876924d54685c3")
  def index
    @location = Location.last
    @destination = Destination.last
    # @distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@destination.latitude,@destination.longitude])
    # binding.pry

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

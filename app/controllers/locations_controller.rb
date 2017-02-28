class LocationsController < ApplicationController
skip_before_filter :verify_authenticity_token
require 'strava/api/v3'
@client = Strava::Api::V3::Client.new(:access_token => "df59fec7116ab07f292dbd7440876924d54685c3")

  def index
    @location = Location.last
    @distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@location.lat,@location.lon])

  end


    def show
      @location = Location.find_by_id(params[:id])
    end


    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to locations_path
      else
        redirect_to root_path
      end
    end




    def destroy
      @location = Location.find_by_id(params[:id])
      @location.destroy
      redirect_to current_user
    end
  private

 def location_params
   params.require(:location).permit(:location, :destination, :user_id, :latitude, :longitude, :lat, :lon)
 end



end

class LocationsController < ApplicationController
skip_before_filter :verify_authenticity_token


  def index
    @location = Location.last
  end


   def add_user
     if logged_in?
       @location = Location.find_by_id(params[:id])
       @user = current_user
       @user.locations << @location
       @user.save
        redirect_to current_user
     else !current_user
         redirect_to login_path
     end
   end

    def show
      @location = Location.find_by_id(params[:id])
    end

    def create
      @location = Location.new(location_params)
      if @location.save
        Location.calc_distance(@location)
        Location.calories(@location)
        Location.guilty(@location)
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

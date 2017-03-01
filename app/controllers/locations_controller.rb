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
        cal_distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@location.lat,@location.lon])
        @location.distance = cal_distance.round(1)
        time = @location.distance / 13
        @location.calories = 8 * 75 * time
        calories = @location.calories

        if calories < 128
          @location.food = "1 Donut"
        elsif @location.calories < 128 * 2
           @location.food = "2 Donuts"
        elsif @location.calories < 128 * 3
          @location.food = "3 Donuts"
       end

          @location.save

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

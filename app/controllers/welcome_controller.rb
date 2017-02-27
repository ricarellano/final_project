class WelcomeController < ApplicationController

  def index
      @user = current_user
      @location = Location.new
      @destination = Destination.new

  end




  private

 def location_params
   params.require(:location, :destination).permit(:address, :address2)
 end
end

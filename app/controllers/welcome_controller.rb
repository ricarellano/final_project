class WelcomeController < ApplicationController

  def index
      @location = Location.new
      @destination = Destination.new

  end




  private

 def location_params
   params.require(:location, :destination).permit(:address, :address2)
 end
end

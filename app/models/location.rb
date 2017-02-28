class Location < ApplicationRecord

  belongs_to :user, optional: true

  geocoded_by :location
  after_validation :geocode

  def geocode
    self.latitude , self.longitude = Geocoder.coordinates(self.location)
    self.lat , self.lon = Geocoder.coordinates(self.destination)
  end

  # def self.cal_dist(location)
  #   location.distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@location.lat,@location.lon])
  #   location.distance = round(1)
  #   location.save
  # end

end

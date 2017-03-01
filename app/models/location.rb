class Location < ApplicationRecord
  validates :location, presence: true
  validates :destination, presence: true
  belongs_to :user, optional: true

  geocoded_by :location
  after_validation :geocode

  def geocode
    self.latitude , self.longitude = Geocoder.coordinates(self.location)
    self.lat , self.lon = Geocoder.coordinates(self.destination)
  end

# def self.mile_distance(location)
#   location.cal_distance = Geocoder::Calculations.distance_between([@location.latitude,@location.longitude], [@location.lat,@location.lon])
#   location.distance = cal_distance.round(1)
#    location.save
#
# end

end

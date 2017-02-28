class Location < ApplicationRecord

  belongs_to :user, optional: true

  geocoded_by :location
  after_validation :geocode

  def geocode
    self.latitude , self.longitude = Geocoder.coordinates(self.location)
    self.lat , self.lon = Geocoder.coordinates(self.destination)
  end


end

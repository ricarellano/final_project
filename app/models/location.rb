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

  def self.calc_distance (location)
    cal_distance = Geocoder::Calculations.distance_between([location.latitude,location.longitude], [location.lat,location.lon])
    location.distance = cal_distance.round(1)
    location.save
  end

  def self.calories (location)
    time = location.distance / 13
    location.calories = 8 * 75 * time
    location.save
  end

  def self.guilty (location)
    if location.calories < 128
      location.food = "1 Donut"
    elsif location.calories < 128 * 2
      location.food = "2 Donuts"
    elsif location.calories < 128 * 3
      location.food = "Burguer + Beer"
    elsif location.calories < 128 * 4
      location.food = "Burguer + Fries + Beer"
    end
      location.save
  end
end

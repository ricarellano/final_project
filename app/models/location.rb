class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user, optional: true
  has_one :destination
end

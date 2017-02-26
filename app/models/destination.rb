class Destination < ApplicationRecord
  geocoded_by :address2
  after_validation :geocode
  belongs_to :user, optional: true
  belongs_to :location, optional: true

end

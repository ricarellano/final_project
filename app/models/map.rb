class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user, optional: true
end

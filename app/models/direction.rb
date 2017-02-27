class Direction < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  has_many :destinations, dependent: :destroy
end

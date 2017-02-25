class User < ApplicationRecord
  has_many :maps, dependent: :destroy
  
end

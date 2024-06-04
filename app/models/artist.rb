class Artist < ApplicationRecord
  belongs_to :user
  
  has_many :bookings
  has_many :ads
  has_many :stages, through: :bookings
end

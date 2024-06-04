class Artist < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :ads
  has_many :stages, through: :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end

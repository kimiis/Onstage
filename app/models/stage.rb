class Stage < ApplicationRecord
  has_many_attached :photos
  belongs_to :user

  has_many :bookings
  has_many :artists, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

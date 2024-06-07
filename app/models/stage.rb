class Stage < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }
  has_many_attached :photos
  belongs_to :user

  has_many :stage_ads
  has_many :bookings
  has_many :artists, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

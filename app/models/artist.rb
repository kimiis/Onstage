class Artist < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }
  has_many_attached :photos
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :stages, through: :bookings, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end

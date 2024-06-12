class ArtistAd < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_content, against: :content, using: { tsearch: { prefix: true } }
  has_one_attached :photo
  belongs_to :artist

  validates :photo, presence: { message: "Veuillez insérer une photo" }
end

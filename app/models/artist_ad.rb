class ArtistAd < ApplicationRecord
  has_one_attached :photo
  belongs_to :artist
end

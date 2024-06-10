class Booking < ApplicationRecord
  belongs_to :artist
  belongs_to :stage

  def self.best_stages
    Booking.all.sort_by(&:rating_value).reverse.first(6).map do |booking|
    booking.stage
    end
  end

  def self.last_ads
    ArtistAd.all.sort_by(&:created_at).first(3) + StageAd.all.sort_by(&:created_at).first(3)
  end
end

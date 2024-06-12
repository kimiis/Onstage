class Booking < ApplicationRecord
  belongs_to :artist
  belongs_to :stage

  def self.best_stages
    @bookings = Stage.near("nantes", 20).map {|stage| stage.bookings}.flatten
    @bookings.sort_by(&:rating_value).reverse.first(6).map do |booking|
    booking.stage
    end
  end

  def self.last_ads
    artist_ads = Artist.near("nantes", 20).map {|artist| artist.artist_ads}.flatten.sort_by(&:created_at).reverse.first(3)
    stage_ads = Stage.near("nantes", 20).map {|stage| stage.stage_ads}.flatten.sort_by(&:created_at).reverse.first(3)
    artist_ads + stage_ads
  end
end

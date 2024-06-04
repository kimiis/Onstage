class Booking < ApplicationRecord
  belongs_to :artist
  belongs_to :stage

  def self.best_stages
    Booking.all.sort_by(&:rating_value).reverse.first(3).map do |booking|
    booking.stage
    end
  end

  def self.lasts_ads
    
  end
end

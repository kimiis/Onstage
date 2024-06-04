class Booking < ApplicationRecord
  belongs_to :artist
  belongs_to :ad
  belongs_to :stage
end

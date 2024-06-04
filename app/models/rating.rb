class Rating < ApplicationRecord
  belongs_to :booking
  belongs_to :artist
  belongs_to :stage
end

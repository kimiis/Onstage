class Ad < ApplicationRecord
  has_one_attached :photo
  belongs_to :artist
  belongs_to :stage

  
end

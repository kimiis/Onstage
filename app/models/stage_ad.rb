class StageAd < ApplicationRecord
  has_one_attached :photo
  belongs_to :stage
end

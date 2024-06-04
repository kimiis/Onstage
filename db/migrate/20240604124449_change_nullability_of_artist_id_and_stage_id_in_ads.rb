class ChangeNullabilityOfArtistIdAndStageIdInAds < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ads, :artist_id, true
    change_column_null :ads, :stage_id, true
  end
end

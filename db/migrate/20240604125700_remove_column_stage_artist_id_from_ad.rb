class RemoveColumnStageArtistIdFromAd < ActiveRecord::Migration[7.1]
  def change
    remove_column :ads, :stage_id, :bigint
    remove_column :ads, :artist_id, :bigint
  end
end

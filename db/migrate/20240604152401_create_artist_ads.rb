class CreateArtistAds < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_ads do |t|
      t.string :content
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

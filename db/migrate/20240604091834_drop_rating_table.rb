class DropRatingTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :ratings, if_exists: true
  end
end

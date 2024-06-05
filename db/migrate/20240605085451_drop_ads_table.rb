class DropAdsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :ads, if_exists: true
  end
end

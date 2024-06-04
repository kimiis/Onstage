class AddUserIdToAds < ActiveRecord::Migration[7.1]
  def change
    add_column :ads, :user_id, :integer
  end
end

class AddNullabillityFalseUserIdToAds < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ads, :user_id, false
  end
end

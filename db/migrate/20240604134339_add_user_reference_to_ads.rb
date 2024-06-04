class AddUserReferenceToAds < ActiveRecord::Migration[7.1]
  def change
    remove_column :ads, :user_id
    add_reference :ads, :user, foreign_key: true
  end
end

class DeleteColumnAdIdFromBooking < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :ad_id, :bigint
  end
end

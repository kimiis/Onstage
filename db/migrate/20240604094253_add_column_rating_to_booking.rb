class AddColumnRatingToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :rating_value, :integer
    add_column :bookings, :rating_comment, :text
  end
end

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.references :artist, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end

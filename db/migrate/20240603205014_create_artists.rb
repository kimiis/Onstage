class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bio
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

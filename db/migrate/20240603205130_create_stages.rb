class CreateStages < ActiveRecord::Migration[7.1]
  def change
    create_table :stages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :phone_number

      t.timestamps
    end
  end
end

class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true
      t.integer :value
      t.string :comment

      t.timestamps
    end
  end
end

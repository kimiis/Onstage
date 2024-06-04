class CreateAds < ActiveRecord::Migration[7.1]
  def change
    create_table :ads do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true
      t.text :content
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end

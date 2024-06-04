class CreateStageAds < ActiveRecord::Migration[7.1]
  def change
    create_table :stage_ads do |t|
      t.string :content
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end

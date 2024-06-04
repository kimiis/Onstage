class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender, foreign_key: { to_table: :users }, index: true, null: false
      t.references :receiver, foreign_key: { to_table: :users }, index: true, null: false
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
